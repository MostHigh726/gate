<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Referral extends Model
{
    //
    protected $fillable = [
        'user_id','reflink_id','total','today','date','parent_id'
    ];
    public function user(){
        return $this->belongsTo('App\User');
    }
    public function reflink(){
        return $this->belongsTo('App\Reflink');
    }
    public function childs() {
        return $this->hasMany('App\Referral','parent_id','id') ;
    }
    public function uplines()
    {
        $this->belongsToMany('App\Referral','parent_id','id') ;
    }

}
