<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use App\EmpPayroll;
use App\EmpProfile;
use App\EmpAttendance;
use Illuminate\Support\Facades\DB;
class EmpPayrollController extends Controller
{
    private function now(){
        date_default_timezone_set('Indian/Chagos');
        $timezone = date_default_timezone_get();
        $now = date_create(date('Y-m-d H:i:s'));
        date_add($now,date_interval_create_from_date_string("-30 minutes"));
        return $now;
    }

    private function validation(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|unique:payroll_payable_info',
        ]);
    }

    private function new_rec_create(array $recs){
        $id = Auth::id();
        $user = User::find($id);

    }

    private function rec_update(array $recs)
    {
        $uid = Auth::id();
        $user = User::find($uid);

        foreach ($recs as $rec) {
            //Check for duplicate entry
            //if(LeaveCategory::where('name', $rec['name'])->count() == 0) {
                //Update data in DB
            //}
        }
    }

    private function rec_delete(array $recs){
        foreach ($recs as $rec) {
            $record = EmpPayroll::find($rec['id']);
            if($record) {
                $record->delete();
            }
        }
    }

    public function index(){
        $empPayrolls = EmpPayroll::getByPaginate(8);
        //dd($empPayrolls);
        $pageSetting = ["page" => "1", "recs" => 8, "sort_type" => "asc", "sort_by" => "id", "query" => ""];
        return view('admin.empPayroll', compact('empPayrolls'))->with('pageSetting', $pageSetting);
    }

    public function fetch_data(Request $request)
    {
        $page = $request->input('fd_page');
        $recs = $request->input('fd_recs');
        $sort_by = $request->input('fd_sort_by');
        $sort_type = $request->input('fd_sort_type');
        $query = $request->input('fd_query');
        $query = Str::replaceArray(" ", ["%"], $query);

        //$this->generate_Pay_Slip();
        $empPayrolls = EmpPayroll::getByConditionalPaginate($recs, $sort_by, $sort_type, $query);
        //dd($empPayrolls);
        $pageSetting = ["page" => $page, "recs" => $recs, "sort_type" => $sort_type, "sort_by" => $sort_by, "query" => $query];
        return view('admin.empPayroll', compact('empPayrolls'))->with('pageSetting', $pageSetting);
    }

    public function processJSON(Request $request)
    {
        $resStr = '';
        $inputs = json_decode($request->input('fd_cud'),true);
        //dd($inputs);

        if(array_key_exists("C", $inputs)){
            $this->new_rec_create($inputs["C"]);
            $resStr .= ($resStr == '' ? 'C' : ';C');
        }

        if(array_key_exists("U", $inputs)){
            $this->rec_update($inputs["U"]);
            $resStr .= ($resStr == '' ? 'U' : ';U');
        }

        if(array_key_exists("D", $inputs)){
            $this->rec_delete($inputs["D"]);
            $resStr .= ($resStr == '' ? 'D' : ';D');
        }


        //Now prepare the query
        $page = $request->input('fd_cud_page');
        $recs = $request->input('fd_cud_recs');
        $sort_by = $request->input('fd_cud_sort_by');
        $sort_type = $request->input('fd_cud_sort_type');
        $query = $request->input('fd_cud_query');
        $query = Str::replaceArray(" ", ["%"], $query);

        $empPayrolls = EmpPayroll::getByConditionalPaginate($recs, $sort_by, $sort_type, $query);
        //dd($empPayrolls);
        $pageSetting = ["page" => $page, "recs" => $recs, "sort_type" => $sort_type, "sort_by" => $sort_by, "query" => $query];
        return view('admin.empPayroll', compact('empPayrolls'))->with('pageSetting', $pageSetting);
    }

    public function generate_Pay_Slip(Request $request){
        $id = Auth::id();
        $user = User::find($id);

        $attendance_CountFD = [];
        $attendance_CountHD = [];
        $leaveCount = [];
        $offDayCount = [];
        $otCount = [];
        $absentCount = [];

        $emp_id = $request->input('emp_id');
        $year = $request->input('year');
        $month = $request->input('month');

        $attendanceRecords = EmpAttendance::getByPaySlipPaginate($emp_id, $year, $month);
        //dd($attendanceRecords);
        if($attendanceRecords and $emp_id) {
            $attendance_CountFD[$emp_id] = 0;
            $attendance_CountHD[$emp_id] = 0;
            $otCount[$emp_id] = 0;
            $absentCount[$emp_id] = 0;
            foreach ($attendanceRecords as $attendanceRecord) {
                if ($attendanceRecord->{'attendance_status'} == 'Full-Day'){
                    $attendance_CountFD[$emp_id]++;
                }
                else if($attendanceRecord->{'attendance_status'} == 'Half-Day') {
                    $attendance_CountHD[$emp_id]++;
                } else if ($attendanceRecord->{'attendance_status'} == 'OT') {
                    $otCount[$emp_id]++;
                } else if ($attendanceRecord->{'attendance_status'} == 'Absent') {
                    $absentCount[$emp_id]++;
                }
            }
        }

    }
}
