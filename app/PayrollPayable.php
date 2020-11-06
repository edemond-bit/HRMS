<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\Paginator;

class PayrollPayable extends Model
{
    protected $table = 'payroll_payable_info';
    protected $primaryKey = 'id';
    public $incrementing = true;
    const CREATED_AT = 'created_date';
    const UPDATED_AT = 'modified_date';

    public static function getByPaginate($recs){
        return DB::table('payroll_payable_info')->select('id', 'name', 'basic', 'hra', 'conveyance',
            'ot', 'leave_encashment', 'allowance', 'in_use')
            ->orderBy('id', 'asc')->paginate($recs);
    }

    public static function getByConditionalPaginate($recs, $sort_by, $sort_type, $query){
        if($query) {
            $shiftCategories = DB::table('payroll_payable_info')
                ->select('id', 'name', 'basic', 'hra', 'conveyance',
                    'ot', 'leave_encashment', 'allowance', 'in_use')
                ->where('id', 'like', '%' . $query . '%')
                ->orWhere('name', 'like', '%' . $query . '%')
                ->orWhere('basic', 'like', '%' . $query . '%')
                ->orWhere('hra', 'like', '%' . $query . '%')
                ->orWhere('conveyance', 'like', '%' . $query . '%')
                ->orWhere('ot', 'like', '%' . $query . '%')
                ->orWhere('leave_encashment', 'like', '%' . $query . '%')
                ->orWhere('allowance', 'like', '%' . $query . '%')
                ->orderBy($sort_by, $sort_type)
                ->paginate($recs);
        }
        else{
            $shiftCategories = DB::table('payroll_payable_info')
                ->select('id', 'name', 'basic', 'hra', 'conveyance',
                    'ot', 'leave_encashment', 'allowance', 'in_use')
                ->orderBy($sort_by, $sort_type)
                ->paginate($recs);
        }
        return $shiftCategories;
    }

    public static function pluck(array $columns){
        $result = null;

        if(count($columns)){
            $result = DB::table('payroll_payable_info')->pluck($columns[0]);
        }
        return $result;
    }
}
