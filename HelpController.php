<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\Product;
use App\Models\Settings;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;


class HelpController extends Controller
{

    public function setPermissions()
    {
        $this->findOrCreatePermission('manage_settings');
        $this->findOrCreatePermission('manage_roles');
        $this->findOrCreatePermission('manage_users');
        $this->findOrCreatePermission('manage_exams');
        $this->findOrCreatePermission('manage_exam_levels');
        $this->findOrCreatePermission('manage_exam_questions');
        $this->findOrCreatePermission('manage_exam_question_items');
        $this->findOrCreatePermission('manage_exam_question_options');
        $this->findOrCreatePermission('manage_results');
    }

    public function getDefaultSettings()
    {
        $this->findOrCreateSetting('site_title', 'Psychology');
        $this->findOrCreateSetting('site_description', 'Psychology Description');
        $this->findOrCreateSetting('site_fav');
        $this->findOrCreateSetting('done_msg','Thank You, See You Soon.');
    }

    public function getSetting($key)
    {
        return Settings::where('key', $key)->first();
    }

    public function findOrCreateSetting($key, $value = null)
    {
        $find = $this->getSetting($key);
        if (!$find) {
            $find = Settings::create([
                'key' => $key,
                'value' => $value
            ]);
        }
        return $find;
    }

    public function getSettingValue($key)
    {
        $find = $this->getSetting($key);
        return (isset($find->id)) ? $find->value : null;
    }


    public function addFullAccessTo($email)
    {
        $this->setPermissions();
        $user = User::where('email', $email)->first();
        $permissions = Permission::all();
        if (!$user) {
            $user = User::create([
                'name' => 'Alireza Mohammadi',
                'email' => 'programmer@the6fallenangels.com',
                'password' => Hash::make(12345678)
            ]);
        }
        foreach ($permissions as $permission) {
            if (!$user->hasPermissionTo($permission->id)) {
                $user->givePermissionTo($permission);
            }
        }
        return true;
    }

    public function findOrCreatePermission($name)
    {
        $find = Permission::where('name', $name)->first();
        if (!$find) {
            $find = Permission::create([
                'name' => $name
            ]);
        }
        return $find;
    }

}
