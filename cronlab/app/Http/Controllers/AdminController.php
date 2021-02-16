<?php

namespace App\Http\Controllers;

use App\Deposit;
use App\Invest;
use App\Kyc;
use App\Kyc2;
use App\Profile;
use App\Settings;
use App\Testimonial;
use App\User;
use App\Withdraw;
use App\Plan;
use App\Interest;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class AdminController extends Controller
{
    //
    public function __construct()
    {

        $this->middleware('admin');

    }

    public function index()
    {

        $deposit_notify = Deposit::whereStatus(0)->get();
        $withdraw_notify = Withdraw::whereStatus(0)->get();
        $kyc_notify = Kyc::whereStatus(0)->get();
        $kyc2_notify = Kyc2::whereStatus(0)->get();

        $earn = Profile::select('main_balance')->sum('main_balance');
        $deposit = Profile::select('deposit_balance')->sum('deposit_balance');
        $invest = Invest::select('amount')->sum('amount');
        $pending = Withdraw::whereStatus(0)->select('amount')->sum('amount');

        $count = (object) array(

            "total"=>User::all()->count(),
            "active"=>User::whereActive(1)->count(),
            "banned"=>User::whereBan(1)->count(),
            "unverified"=>User::whereActive(0)->count(),
        );

        return view('admin.index',compact('deposit_notify','withdraw_notify',
            'kyc_notify','kyc2_notify','earn','deposit','invest','pending','count'));
    }

    public function userDeposits()
    {
        $deposits= Deposit::where('status', '>=', 1)->orderBy('updated_at','desc')->get();
        
        foreach($deposits as $deposit) {
            $investment = Invest::find($deposit->invest_id);
            
            if($investment) {
                $plan = Plan::find($investment->plan_id)->first();
                
                if($plan) {
                    $deposit->plan_name = $plan->name;
                }
            }
        }
        
        $settings = Settings::first();

        return view('admin.deposit.index',compact('deposits','settings'));


    }
    public function userWithdraws()
    {
        $withdraws= Withdraw::where('status', '>=', 1)->orderBy('updated_at','desc')->paginate(20);

        $settings = Settings::first();

        return view('admin.withdraw.index',compact('withdraws','settings'));


    }
    public function userWithdrawsRequest()
    {
        $withdraws= Withdraw::whereStatus(0)->orderBy('created_at','desc')->paginate(20);

        $settings = Settings::first();

        return view('admin.withdraw.request',compact('withdraws','settings'));


    }

    public function localDeposits()
    {
        $deposits= Deposit::whereStatus(0)->orderBy('created_at','desc')->get();
        
        foreach($deposits as $deposit) {
            $investment = Invest::find($deposit->invest_id);
            
            if($investment) {
                $plan = Plan::find($investment->plan_id);
                
                if($plan) {
                    $deposit->plan_name = $plan->name;
                }
            }
        }

        $settings = Settings::first();

        return view('admin.deposit.local',compact('deposits','settings'));


    }

    public function localDepositsUpdate($id)
    {

        $deposit = Deposit::find($id);
        $investment = Invest::find($deposit->invest_id);
        $interest = Interest::where('invest_id', $deposit->invest_id)->first();
        $plan = Plan::find($investment->plan_id);
        
        $user = $deposit->user;
        $user->profile->deposit_balance = $user->profile->deposit_balance +  $deposit->net_amount;
        $user->profile->save();

        $deposit->status = 1;
        $deposit->save();
        
        $delay = $plan->start_duration;
        $today = Carbon::now();
        
        $investment->start_time = $today->addHours($delay);
        $investment->save();

        $interest->start_time = $today->addHours($delay);
        $interest->save();

        session()->flash('message', 'User Deposit Request Has Been Successfully Approved');
        Session::flash('type', 'success');
        Session::flash('title', 'Deposit Approved');

        return redirect()->back();


    }

    public function localDepositsFraud($id)
    {


        $deposit= Deposit::find($id);
        $deposit->status = 2;
        $deposit->save();



        session()->flash('message', 'User Deposit Has Been Successfully Set As Fraud');
        Session::flash('type', 'success');
        Session::flash('title', 'Fraud Successfully');

        return redirect()->back();
    }

    public function payment($id)
    {
        $withdraw= Withdraw::find($id);

        $withdraw->status = 1;

        $withdraw->save();

        session()->flash('message', 'User Withdraw Request Has Been Successfully Approved');
        Session::flash('type', 'success');
        Session::flash('title', 'Withdraw Approved');

        return redirect()->back();
    }

    public function withdrawFraud($id)
    {
        $withdraw= Withdraw::find($id);


        $withdraw->status = 2;
        $withdraw->save();

        $user =  $withdraw->user;

        $user->profile->main_balance = $user->profile->main_balance + $withdraw->amount;

        $user->profile->save();

        session()->flash('message', 'User Withdraw Has Been Successfully Refund');
        Session::flash('type', 'success');
        Session::flash('title', 'Refund Successfully');

        return redirect()->back();
    }
    public function review()
    {
        $reviews= Testimonial::latest()->paginate(20);

        return view('admin.testimonials.index',compact('reviews'));
    }

    public function reviewPublish($id)
    {
        $review= Testimonial::find($id);

        $review->status = 1;

        $review->save();

        session()->flash('message', 'User Review Has Been Successfully Published');
        Session::flash('type', 'success');
        Session::flash('title', 'Published Successfully');

        return redirect()->back();
    }
    public function reviewUnPublish($id)
    {
        $review= Testimonial::find($id);

        $review->status = 0;

        $review->save();

        session()->flash('message', 'User Review Has Been Successfully Un-Published');
        Session::flash('type', 'success');
        Session::flash('title', 'Un-Published Successfully');

        return redirect()->back();
    }



}
