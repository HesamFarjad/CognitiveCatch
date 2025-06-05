<?php

namespace App\Http\Livewire\Panel;

use App\Traits\SweetToast;
use Livewire\Component;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class Roles extends Component
{
    use SweetToast;
    public $title = 'Roles';
    public $role, $en_name;
    public $selected_permissions = [];
    protected $listeners = ['deleteData' => 'deleteData'];

    public function deleteData(Role $item)
    {
        $res = $item->delete();
        $this->toast($res);
        $this->reset();
    }
    public function addModal()
    {
        $this->resetValidation();
        $this->reset();
        $this->emit('showModal', 'modal');
    }

    public function edit(Role $item)
    {
        $this->resetValidation();
        $this->reset();
        $this->role = $item;
        $this->en_name = $item->name;
        foreach ($this->role->permissions as $permission){
            $this->selected_permissions[] = $permission->id;
        }
        $this->emit('setPermissions');
        $this->emit('showModal','modal');
    }
    protected function rules()
    {
        return [
            'en_name' => 'required'
        ];
    }

    public function save()
    {
        $this->validate();
        $data = [
            'name' => $this->en_name,
        ];
        if ($this->role){
            $this->role->update($data);
            $res = $this->role->syncPermissions($this->selected_permissions);
        }else{
            $res = Role::create($data);
            if ($this->selected_permissions){
                $res = $res->syncPermissions($this->selected_permissions);
            }
        }
        $this->emit('closeModals');
        $this->sweet($res);
    }

    public function render()
    {
        $datas = Role::all();
        $permissions = Permission::all();
        $this->dispatchBrowserEvent('reload');
        return view('livewire.panel.roles')->with(['datas' => $datas, 'permissions' => $permissions]);
    }
}
