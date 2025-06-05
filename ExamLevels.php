<?php

namespace App\Http\Livewire\Panel;

use App\Models\Exam;
use App\Models\ExamLevel;
use App\Traits\SweetToast;
use Livewire\Component;
use Livewire\WithPagination;

class ExamLevels extends Component
{
    use WithPagination, SweetToast;

    public $title;
    public $item;
    public $exam;
    public $level_name;
    public $search;

    protected $listeners = ['deleteData' => 'deleteData'];


    public function deleteData(ExamLevel $item)
    {
        $res = $item->delete();
        $this->toast($res);
    }

    public function addModal()
    {
        $this->resetValidation();
        $this->resetExcept(['exam','title']);
        $this->emit('showModal', 'modal');
    }

    public function edit(ExamLevel $item)
    {
        $this->resetValidation();
        $this->resetExcept(['exam','title']);
        $this->item = $item;
        $this->level_name = $item->name;
        $this->emit('showModal', 'modal');
    }

    public function save()
    {
        $rules = [
            'level_name' => 'required'
        ];
        $this->validate($rules);
        $data = [
            'name' => $this->level_name,
            'exam_id' => $this->exam->id
        ];
        if ($this->item) {
            $res = $this->item->update($data);
        } else {
            $res = ExamLevel::create($data);
        }
        $this->emit('closeModals');
        $this->sweet($res,['title','exam']);
    }

    public function returnData()
    {
        $datas = new ExamLevel;
        $datas = $datas->whereExamId($this->exam->id);
        $search = str($this->search)->trim();
        if ($search) {
            $search = '%' . $search . '%';
            $datas = $datas->where(function ($q) use ($search) {
                return $q->where('name', 'like', $search);
            });
        }
        return $datas;
    }

    public function getDatas()
    {
        return $this->returnData()->orderBy('created_at', 'desc')->paginate(25);
    }

    public function mount(Exam $exam)
    {
        $this->exam = $exam;
        $this->title = $exam->name . "'s  Levels";
    }

    public function render()
    {
        $this->dispatchBrowserEvent('reload');
        $datas = $this->getDatas();
        return view('livewire.panel.exam-levels')->with(['datas' => $datas]);
    }
}
