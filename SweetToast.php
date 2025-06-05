<?php

namespace App\Traits;
trait SweetToast
{
    private $success = 'Successfully Done.';
    private $err = 'An Error Occurred.';

    public function sweet($res, $resetExcept = [], $msg = null, $closeModals = true): void
    {
        if ($res) {
            $this->emit('sweetSuccess', $msg ? $msg : $this->success, $closeModals);
            $this->resetExcept($resetExcept);
        } else {
            $this->emit('sweetError', [$msg ? $msg : $this->err, $closeModals]);
        }
    }

    public function toast($res, $text = null): void
    {
        if ($res) {
            $this->emit('toast', ['success', $text ? $text : $this->success, '']);
        } else {
            $this->emit('toast', ['error', $text ? $text : $this->err, '']);
        }
    }

    public function console($log): void
    {
        $this->emit('consoleLog', $log);
    }
}
