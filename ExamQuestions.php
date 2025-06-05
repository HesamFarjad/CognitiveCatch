<?php

namespace App\Http\Livewire\Panel;

use App\Models\ExamLevel;
use App\Models\ExamQuestion;
use App\Traits\SweetToast;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class ExamQuestions extends Component
{
    use WithPagination, SweetToast, WithFileUploads;

    public $title;
    public $item;
    public $level;
    public $question;
    public $search;

    protected $listeners = ['deleteData' => 'deleteData'];


    public function deleteData(ExamQuestion $item)
    {
        $res = $item->delete();
        $this->toast($res);
    }

    public function addModal()
    {
        $this->resetValidation();
        $this->resetExcept(['level', 'title']);
        $this->emit('showModal', 'modal');
    }

    public function edit(ExamQuestion $item)
    {
        $this->resetValidation();
        $this->resetExcept(['level', 'title']);
        $this->item = $item;
        $this->question = $item->question;
        $this->emit('showModal', 'modal');
    }

    public function save()
    {
        $rules = [
            'question' => 'required'
        ];
        $this->validate($rules);
        $data = [
            'question' => $this->question,
            'exam_level_id' => $this->level->id
        ];
        if ($this->item) {
            $res = $this->item->update($data);
        } else {
            $res = ExamQuestion::create($data);
        }
        $this->emit('closeModals');
        $this->sweet($res, ['title', 'level']);
    }

    public function returnData()
    {
        $datas = new ExamQuestion;
        $datas = $datas->whereExamLevelId($this->level->id);
        $search = str($this->search)->trim();
        if ($search) {
            $search = '%' . $search . '%';
            $datas = $datas->where(function ($q) use ($search) {
                return $q->where('question', 'like', $search);
            });
        }
        return $datas;
    }

    public function getDatas()
    {
        return $this->returnData()->orderBy('created_at', 'desc')->paginate(25);
    }

    public function mount(ExamLevel $level)
    {
        $this->level = $level;
        $this->title = $level->name . "'s  Questions";
    }

    public function render()
    {
        $this->dispatchBrowserEvent('reload');
        $datas = $this->getDatas();
        return view('livewire.panel.exam-questions')->with(['datas' => $datas]);
    }
}
