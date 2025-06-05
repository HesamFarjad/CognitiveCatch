<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamQuestion extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function level()
    {
        return $this->belongsTo(ExamLevel::class, 'exam_level_id');
    }

    public function items()
    {
        return $this->hasMany(ExamQuestionItem::class,'exam_question_id');
    }

    public function options()
    {
        return $this->hasMany(ExamQuestionOption::class,'exam_question_id');
    }
}
