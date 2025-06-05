<?php

namespace App\Http\Livewire\Panel;

use App\Models\Result;
use App\Traits\SweetToast;
use Livewire\Component;
use Livewire\WithPagination;

class Results extends Component
{
    use WithPagination, SweetToast;

    public $title = 'Results';
    public $item;
    public $search;

    protected $listeners = ['deleteData' => 'deleteData'];

    public function user(Result $item)
    {
        $this->item = $item;
        $this->emit('showModal', 'user');
    }
    public function result(Result $item)
    {
        $this->item = $item;
        $this->emit('showModal', 'result');
    }

    public function deleteData(Result $item)
    {
        $item->answers()->delete();
        $res = $item->delete();
        $this->toast($res);
    }

    public function addModal()
    {
        $this->emit('showModal', 'modal');
    }

    public function returnData()
    {
        $datas = new Result;
        $search = str($this->search)->trim();
        if ($search) {
            $search = '%' . $search . '%';
            $datas = $datas->where(function ($q) use ($search) {
                return $q->where('first_name', 'like', $search)->orWhere('last_name', 'like', $search);
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
        return view('livewire.panel.results')->with(['datas' => $datas]);
    }
}
