<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use App\ApiModel;
use App\EmpAttendance;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ApiController extends Controller
{
    //
    private function now(){
        date_default_timezone_set('Indian/Chagos');
        $timezone = date_default_timezone_get();
        $now = date_create(date('Y-m-d H:i:s'));
        date_add($now,date_interval_create_from_date_string("-30 minutes"));
        return $now;
    }

    public function login() {
        $key = $_GET['secret_key'];
        $token = $_GET['token_key'];
        $validate = ApiModel::ApiValidate($token, $key);
        if ($validate == 1) {
            $result = $this->punchin_punchout();
            //dd($result);
            if (count($result)>0) {
                $responseData = array('success' => '1', 'data' => array($result));
            } else {
                $responseData = array('success' => '0', 'data' => array($result));
            }
        } else {
            $user_data = array('error' => array());
            $responseData = array('success' => '0', 'data' => $user_data, 'message' => "Unauthenticated call.");
        }
        $userResponse = json_encode($responseData);
        print $userResponse;
    }

    private function punchin_punchout() {
        if($this->loggedin()){
            return $this->logoutAttendance();
        }
        else{
            return $this->loginAttendance();
        }
    }

    private function loggedin(){
        $display_id = $_GET['emp_id'];

        $query = DB::table('emp_profile')
            ->select('profile_id')
            ->where('emp_display_id', '=', $display_id)
            ->get();

        if($query[0]->profile_id){
            $query2 = DB::table('emp_attendance')
                ->select('emp_attendance.*')
                //->exists('login_date')
                ->where('emp_id', '=', $query[0]->profile_id)
                ->where('logout_date', '=', null)
                ->get();

            if(count($query2) > 0){
                return true;
            }
            else{
                return false;
            }
        }
    }

    private function loginAttendance(){
        $c_status = '';
        $status_msg = '';
        $display_id = $_GET['emp_id'];
        //$user = User::find($uid);
        $login = $this->now();
        $strLogIn = $login->format('Y-m-d H:i:s');

        $query = DB::table('emp_profile')
            ->select('profile_id')
            ->where('emp_display_id', '=', $display_id)
            ->get();

        DB::statement('call attendance_sheet_login(?,?,?,?)', [$query[0]->profile_id, $strLogIn, @c_status, @status_msg]);
        //dd(@c_status);
        //return view('home', compact('strLogIn'));
        $user_data = array(
            'login' => $strLogIn,
            'message' => 'Successful Check-In',
        );
        return $user_data;
    }

    private function logoutAttendance(){
        $c_status = '';
        $status_msg = '';
        $display_id = $_GET['emp_id'];
        //$user = User::find($uid);
        $logout = $this->now();
        $strLogOut = $logout->format('Y-m-d H:i:s');

        $query = DB::table('emp_profile')
            ->select('profile_id')
            ->where('emp_display_id', '=', $display_id)
            ->get();

        DB::statement('call attendance_sheet_logout(?,?,?,?)', [$query[0]->profile_id, $strLogOut, @c_status, @status_msg]);
        //dd($status_msg);
        //return view('home', compact('strLogOut'));
        $user_data = array(
            'logout' => $strLogOut,
            'message' => 'Successful Check-Out',
        );
        return $user_data;
    }
}
