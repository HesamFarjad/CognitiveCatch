<?php

namespace App\Http\Livewire\Panel;

use App\Models\Exam;
use App\Traits\SweetToast;
use Livewire\Component;
use Livewire\WithPagination;

class Exams extends Component
{
    use WithPagination, SweetToast;

    public $title = 'Exams';
    public $item;
    public $exam_name;
    public $search;

    protected $listeners = ['deleteData' => 'deleteData'];


    public function deleteData(Exam $item)
    {
        $res = $item->delete();
        $this->toast($res);
    }

    public function addModal()
    {
        $this->resetValidation();
        $this->reset();
        $this->emit('showModal', 'modal');
    }

    public function edit(Exam $item)
    {
        $this->resetValidation();
        $this->reset();
        $this->item = $item;
        $this->exam_name = $item->name;
        $this->emit('showModal', 'modal');
    }

    public function toggle(Exam $item)
    {
        $others = Exam::whereIsActive(1)->get();
        foreach ($others as $other){
            $other->update(['is_active' => 0]);
        }
        $this->toast($item->update(['is_active' => 1]));
    }

    public function save()
    {
        $rules = [
            'exam_name' => 'required'
        ];
        $this->validate($rules);
        $data = [
            'name' => $this->exam_name,
        ];
        if ($this->item) {
            $res = $this->item->update($data);
        } else {
            $res = Exam::create([
                'name' => $this->exam_name
            ]);
        }
        $this->emit('closeModals');
        $this->sweet($res);
    }

    public function returnData()
    {
        $datas = new Exam;
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

    public function render()
    {
        $this->dispatchBrowserEvent('reload');
        $datas = $this->getDatas();
        return view('livewire.panel.exams')->with(['datas' => $datas]);
    }
}
