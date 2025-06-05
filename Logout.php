<?php

namespace App\Http\Livewire\Panel;

use Illuminate\Support\Facades\Auth;
use Livewire\Component;

class Logout extends Component
{
    public function logout()
    {
        Auth::logout();
        $this->redirectRoute('public.auth');
    }

    public function render()
    {
        return view('livewire.panel.logout');
    }
}
