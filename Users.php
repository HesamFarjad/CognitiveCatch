<?php

namespace App\Http\Livewire\Panel;

use App\Models\User;
use App\Traits\SweetToast;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Livewire\Component;
use Livewire\WithPagination;
use Spatie\Permission\Models\Role;

class Users extends Component
{
    use WithPagination, SweetToast;

    public $title = 'Users';
    public $user;
    public $user_name, $email, $password;
    public $selected_roles = [];
    public $search;

    protected $listeners = ['deleteData' => 'deleteData'];


    public function deleteData(User $item)
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

    public function edit(User $item)
    {
        $this->resetValidation();
        $this->reset();
        $this->user = $item;
        $this->user_name = $item->name;
        $this->email = $item->email;
        foreach ($this->user->roles as $role) {
            $this->selected_roles[] = $role->id;
        }
        $this->emit('showModal', 'modal');
    }

    public function save()
    {
        $rules = [
            'user_name' => 'required',
            'email' => ['email', 'required', 'unique:users,email'],
        ];
        if ($this->user) {
            $rules['email'][count($rules['email']) - 1] .= ',' . $this->user->id;
            if (trim($this->password)) {
                $rules['password'] = 'min:8';
            }
            $this->validate($rules);
            $data = [
                'name' => $this->user_name,
                'email' => $this->email
            ];
            if (trim($this->password)) {
                $data['password'] = Hash::make(trim($this->password));
            }
            $this->user->syncRoles($this->selected_roles);
            foreach ($this->selected_roles as $role) {
                $role = Role::findById($role);
                $this->user->syncPermissions($role->permissions);
            }
            $res = $this->user->update($data);
        } else {
            $rules['password'] = 'required|min:8';
            $this->validate($rules);
            $res = User::create([
                'name' => $this->user_name,
                'email' => $this->email,
                'password' => Hash::make($this->password)
            ]);
            if (count($this->selected_roles)) {
                $res->syncRoles($this->selected_roles);
                foreach ($this->selected_roles as $role) {
                    $role = Role::findById($role);
                    $res->syncPermissions($role->permissions);
                }
            }
        }
        $this->emit('closeModals');
        $this->sweet($res);
    }

    public function returnData()
    {
        $datas = new User;
        $search = str($this->search)->trim();
        if ($search) {
            $search = '%' . $search . '%';
            $datas = $datas->where(function ($q) use ($search) {
                return $q->where('name', 'like', $search)
                    ->orWhere('email', 'like', $search);
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
        $roles = Role::all();
        return view('livewire.panel.users')->with(['datas' => $datas, 'roles' => $roles]);
    }
}
