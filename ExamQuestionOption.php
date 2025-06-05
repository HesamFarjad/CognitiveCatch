<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamQuestionOption extends Model
{
    use HasFactory;

    protected $guarded = [];

//    public function question()
//    {
//        return $this->belongsTo(ExamQuestion::class, 'exam_question_id');
//    }
}
