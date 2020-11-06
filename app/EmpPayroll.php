<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\Paginator;

class EmpPayroll extends Model
{
    protected $table = 'emp_payroll';
    protected $primaryKey = 'id';
    public $incrementing = true;
    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'modified_date';

    public static function getByPaginate($recs){
        return DB::table('emp_payroll')->select('emp_payroll.id as id', 'issue_date', 'emp_profile.emp_display_id as emp_display_id',
            'attendance_count', 'leave_count', 'off_day_count', 'ot_count', 'absent_count', 'basic', 'hra', 'conveyance', 'ptax_deduction',
            'esi_deduction', 'pf_deduction', 'tds_deduction', 'medicine_due', 'food_charge', 'loan_due_deduction', 'other_deduction',
            'net_amount_payable')
            ->leftjoin('emp_profile', 'emp_payroll.emp_id', '=', 'emp_profile.profile_id')
            ->orderBy('emp_payroll.id', 'asc')->paginate($recs);
    }

    public static function getByConditionalPaginate($recs, $sort_by, $sort_type, $query){
        if($query) {
            $empPayrollInfo = DB::table('emp_payroll')
                ->select('emp_payroll.id as id', 'issue_date', 'emp_profile.emp_display_id as emp_display_id',
                    'attendance_count', 'leave_count', 'off_day_count', 'ot_count', 'absent_count', 'basic', 'hra', 'conveyance', 'ptax_deduction',
                    'esi_deduction', 'pf_deduction', 'tds_deduction', 'medicine_due', 'food_charge', 'loan_due_deduction', 'other_deduction',
                    'net_amount_payable')
                ->leftjoin('emp_profile', 'emp_payroll.emp_id', '=', 'emp_profile.profile_id')
                ->orWhere('emp_payroll.id', 'like', '%' . $query . '%')
                ->orWhere('issue_date', 'like', '%' . $query . '%')
                ->orWhere('emp_profile.emp_display_id', 'like', '%' . $query . '%')
                ->orWhere('attendance_count', 'like', '%' . $query . '%')
                ->orWhere('leave_count', 'like', '%' . $query . '%')
                ->orWhere('off_day_count', 'like', '%' . $query . '%')
                ->orWhere('ot_count', 'like', '%' . $query . '%')
                ->orWhere('absent_count', 'like', '%' . $query . '%')
                ->orWhere('basic', 'like', '%' . $query . '%')
                ->orWhere('hra', 'like', '%' . $query . '%')
                ->orWhere('conveyance', 'like', '%' . $query . '%')
                ->orWhere('ptax_deduction', 'like', '%' . $query . '%')
                ->orWhere('esi_deduction', 'like', '%' . $query . '%')
                ->orWhere('pf_deduction', 'like', '%' . $query . '%')
                ->orWhere('tds_deduction', 'like', '%' . $query . '%')
                ->orWhere('medicine_due', 'like', '%' . $query . '%')
                ->orWhere('food_charge', 'like', '%' . $query . '%')
                ->orWhere('loan_due_deduction', 'like', '%' . $query . '%')
                ->orWhere('other_deduction', 'like', '%' . $query . '%')
                ->orWhere('net_amount_payable', 'like', '%' . $query . '%')
                ->orderBy($sort_by, $sort_type)
                ->paginate($recs);
        }
        else{
            $empPayrollInfo = DB::table('emp_payroll')
                ->select('emp_payroll.id as id', 'issue_date', 'emp_profile.emp_display_id as emp_display_id',
                    'attendance_count', 'leave_count', 'off_day_count', 'ot_count', 'absent_count', 'basic', 'hra', 'conveyance', 'ptax_deduction',
                    'esi_deduction', 'pf_deduction', 'tds_deduction', 'medicine_due', 'food_charge', 'loan_due_deduction', 'other_deduction',
                    'net_amount_payable')
                ->leftjoin('emp_profile', 'emp_payroll.emp_id', '=', 'emp_profile.profile_id')
                ->orderBy($sort_by, $sort_type)
                ->paginate($recs);
        }
        return $empPayrollInfo;
    }

    public static function pluck(array $columns){
        $result = null;

        if(count($columns)){
            $result = DB::table('emp_payroll')->pluck($columns[0]);
        }
        return $result;
    }
}
