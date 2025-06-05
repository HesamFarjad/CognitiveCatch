<?php

namespace App\Http\Livewire\Public;

use Illuminate\Validation\ValidationException;
use Livewire\Component;

class Auth extends Component
{
    public $title = 'Authentication';
    public $email, $password;

    public function login()
    {
        $this->validate([
            'email' => 'email|required',
            'password' => 'required'
        ]);
        if (\Illuminate\Support\Facades\Auth::attempt(['email' => $this->email, 'password' => $this->password])) {
            $this->redirectRoute('panel.main');
        } else {
            throw ValidationException::withMessages(['email' => 'Invalid Email/Password']);
        }
    }

    public function render()
    {
        return view('livewire.public.auth');
    }
}
