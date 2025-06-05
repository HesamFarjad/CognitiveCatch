<?php

namespace App\Http\Livewire\Panel;

use App\Models\ExamLevel;
use App\Models\ExamQuestion;
use App\Models\ExamQuestionItem;
use App\Traits\SweetToast;
use Livewire\Component;
use Livewire\WithFileUploads;
use Livewire\WithPagination;

class ExamQuestionItems extends Component
{
    use WithPagination, SweetToast, WithFileUploads;

    public $title;
    public $item;
    public $question;
    public $image, $image_prev, $color, $count, $shape;
    public $search;

    protected $listeners = ['deleteData' => 'deleteData'];

    public function toggleCorrect(ExamQuestionItem $item)
    {
        $this->toast($item->update([
            'correct' => !$item->correct
        ]));
    }
    public function deleteData(ExamQuestionItem $item)
    {
        $res = $item->delete();
        $this->toast($res);
    }

    public function addModal()
    {
        $this->resetValidation();
        $this->resetExcept(['question', 'title']);
        $this->emit('showModal', 'modal');
    }

    public function edit(ExamQuestionItem $item)
    {
        $this->resetValidation();
        $this->resetExcept(['question', 'title']);
        $this->item = $item;
        $this->image = $item->image;
        $this->color = $item->color;
        $this->shape = $item->shape;
        $this->count = $item->count;
        $this->emit('showModal', 'modal');
    }

    public function save()
    {
        $rules = [
            'color' => 'required',
            'shape' => 'required',
            'count' => 'required|numeric',
        ];
        if (!$this->item) {
            $rules['image_prev'] = 'required';
        }
        $this->validate($rules);
        $data = [
            'color' => $this->color,
            'shape' => $this->shape,
            'count' => $this->count,
            'exam_question_id' => $this->question->id
        ];
        if (isset($this->image_prev)) {
            $data['image'] = $this->image_prev->store('uploads/questions/items');
        }
        if ($this->item) {
            $res = $this->item->update($data);
        } else {
            $res = ExamQuestionItem::create($data);
        }
        $this->emit('closeModals');
        $this->sweet($res, ['title', 'question']);
    }

    public function returnData()
    {
        $datas = new ExamQuestionItem;
        $datas = $datas->whereExamQuestionId($this->question->id);
        $search = str($this->search)->trim();
        if ($search) {
            $search = '%' . $search . '%';
            $datas = $datas->where(function ($q) use ($search) {
                return $q->where('shape', 'like', $search)->orWhere('color', 'like', $search)->orWhere('count', 'like', $search);
            });
        }
        return $datas;
    }

    public function getDatas()
    {
        return $this->returnData()->orderBy('created_at', 'desc')->paginate(25);
    }

    public function mount(ExamQuestion $question)
    {
        $this->question = $question;
        $this->title = 'Question ' . $question->id . " Items";
    }

    public function render()
    {
        $this->dispatchBrowserEvent('reload');
        $datas = $this->getDatas();
        return view('livewire.panel.exam-question-items')->with(['datas' => $datas]);
    }
}
