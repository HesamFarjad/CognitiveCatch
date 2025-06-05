<?php

namespace App\Http\Livewire\Public;

use App\Models\Exam;
use App\Models\ExamQuestionItem;
use App\Models\Result;
use App\Models\ResultAnswer;
use App\Traits\SweetToast;
use Carbon\Carbon;
use Livewire\Component;

class Main extends Component
{
    use SweetToast;

    public $exam;
    public $levels;
    public $questions;
    public $question_index = -1, $level_index = -1;
    public $answers = [];
    public $step = 0;
    public $first_name, $last_name, $birth_date, $gender, $email, $address;

    public function start()
    {
        $this->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'birth_date' => 'required|date',
            'gender' => 'required|in:male,female,other',
            'email' => 'required|email',
            'address' => 'required|max:25'
        ]);
        $this->step = 1;
        $this->next(false);
    }

    function new_level_toast()
    {
        if (isset($this->levels[$this->level_index])) {
            $this->toast(true, $this->levels[$this->level_index]->name);
        }
    }

    function toast_select_answer()
    {
        if ($this->level_index !== -1) {
            $this->toast(false, 'Select an Image first.');
        }
    }

    function selectAnswer(ExamQuestionItem $item)
    {
        $data = [$item->id, Carbon::now()];
        if (isset($this->answers[$item->question->id])) {
            $this->answers[$item->question->id][1] = $data;
        } else {
            $this->answers[$item->question->id] = [$data, $data];
        }
        $this->emit('selectItem', $item->id);
    }

    function saveAnswers()
    {
        $result = Result::create([
            'exam_id' => $this->exam->id,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'birth_date' => $this->birth_date,
            'gender' => $this->gender,
            'email' => $this->email,
            'address' => $this->address
        ]);
        foreach ($this->answers as $question_id => $selects) {
            ResultAnswer::create([
                'result_id' => $result->id,
                'exam_question_id' => $question_id,
                'first_exam_question_item_id' => $selects[0][0],
                'first_select_time' => Carbon::parse($selects[0][1]),
                'last_exam_question_item_id' => $selects[1][0],
                'last_select_time' => Carbon::parse($selects[1][1])
            ]);
        }
        $this->step = 2;
        $this->toast($result, 'Successfully Done.');
    }

    function next($from_question = true)
    {
        if (!$this->levels) {
            $this->levels = $this->exam->levels;
        }
        if (count($this->levels)) {
            if ($this->level_index == -1) {
                $this->level_index = 0;
                $this->new_level_toast();
            }
            if (isset($this->levels[$this->level_index])) {
                if (count($this->levels[$this->level_index]->questions)) {
                    $this->questions = $this->levels[$this->level_index]->questions;
                    if ($from_question) {
                        if (isset($this->questions[$this->question_index]) && isset($this->levels[$this->level_index])) {
                            if (!isset($this->answers[$this->questions[$this->question_index]->id])) {
                                $this->toast_select_answer();
                                return false;
                            }
                        }
                    }
                    $this->question_index += 1;
                    if (!isset($this->questions[$this->question_index])) {
                        $this->level_index += 1;
                        if (isset($this->levels[$this->level_index])) {
                            $this->questions = $this->levels[$this->level_index]->questions;
                        }
                        $this->new_level_toast();
                        $this->question_index = 0;
                        if (!isset($this->levels[$this->level_index])) {
                            $this->saveAnswers();
                        }
                    }
                } else {
                    $this->level_index += 1;
                    $this->new_level_toast();
                }
            } else {
                $this->saveAnswers();
            }
        } else {
            $this->saveAnswers();
        }
    }

    public function mount()
    {
        $this->exam = Exam::whereIsActive(1)->first();
    }

    public function render()
    {
        return view('livewire.public.main');
    }
}
