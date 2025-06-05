<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResultAnswer extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function question()
    {
        return $this->belongsTo(ExamQuestion::class,'exam_question_id');
    }

    public function first_answer()
    {
        return $this->belongsTo(ExamQuestionItem::class,'first_exam_question_item_id');
    }

    public function last_answer()
    {
        return $this->belongsTo(ExamQuestionItem::class,'last_exam_question_item_id');
    }
}
