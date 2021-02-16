<?php

namespace App\Http\Controllers;

use App\Advert;
use App\AdvertPlan;
use App\Kyc;
use App\Kyc2;
use App\Membership;
use App\Notice;
use App\Notifications\KYC2VerifyAccept;
use App\Notifications\KYCVerifyAccept;
use App\Order;
use App\Post;
use App\Ptc;
use App\Referral;
use App\Scheme;
use App\Settings;
use App\Testimonial;
use App\User;
use App\UserAdvert;
use App\UserLog;
use App\Withdraw;
use Carbon\Carbon;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use function MongoDB\BSON\toJSON;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        $time = date('M j, Y  H:i:s', strtotime($user->bonus));
        $rewards = json_encode($time);
        $withdraw = Withdraw::whereUser_id($user->id)->whereStatus(1)->select('amount')->sum('amount');;

        $posts = Post::inRandomOrder()->take(3)->get();

        $notify = Notice::whereUser_id($user->id)->whereStatus(0)->get();


        return view('user.index', compact('user','posts', 'withdraw','notify','rewards'));
    }

    public function message()
    {
        $user = Auth::user();

        $inboxes = Notice::whereUser_id($user->id)->orderBy('created_at', 'desc')->paginate(20);

        return view('user.mails.index', compact('inboxes'));
    }

    public function daily()
    {
        $user = Auth::user();

        $now = Carbon::now();
        $settings = Settings::first();
        if ($user->bonus < $now ){

            $user->bonus = $now->addHours(24);
            $user->save();
            $user->profile->main_balance = $user->profile->main_balance + $settings->daily_rewards;
            $user->profile->save();

            session()->flash('message', "You have successfully Claimed your $ ".$settings->daily_rewards." daily rewards.");
            Session::flash('type', 'success');
            Session::flash('title', 'Claimed Successful');

            return redirect()->route('userDashboard');
        }

        session()->flash('message', "You have Claimed your $ ".$settings->daily_rewards." daily rewards already.");
        Session::flash('type', 'warning');
        Session::flash('title', 'Claimed Already');

        return redirect()->route('userDashboard');
    }

    public function messageShow($id)
    {
        $inbox = Notice::find($id);
        $inbox->status = 1;
        $inbox->save();

        return view('user.mails.show', compact('inbox'));
    }

    public function messageDown($id)
    {
        $inbox = Notice::find($id);
        $file = $inbox->file;
            // Get parameters
            $file = urldecode($file); // Decode URL-encoded string
            $filepath = $file;

            // Process download
            if(file_exists($filepath)) {
                header('Content-Description: File Transfer');
                header('Content-Type: application/octet-stream');
                header('Content-Disposition: attachment; filename="'.basename($filepath).'"');
                header('Expires: 0');
                header('Cache-Control: must-revalidate');
                header('Pragma: public');
                header('Content-Length: ' . filesize($filepath));
                flush(); // Flush system output buffer
                readfile($filepath);
                exit;
            }

    }

    public function uPlan()
    {

        $uPlans = Scheme::whereStatus(1)->get();
        $memberships = Membership::all();

        return view('user.advert.index', compact('uPlans', 'memberships'));
    }

    public function pShow($id)
    {

        $log = Order::findOrFail($id);
        return view('user.viewads.preads', compact('log'));

    }

    public function uPlanActive(Request $request, $id)
    {

        $user = Auth::user();

        $uPlan = Scheme::find($id);

        if ($uPlan->type == 1) {

            $this->validate($request, [
                'name' => 'required|min:1|max:199',
                'url' => 'required|url',
                'membership' => 'required|min:1',
            ]);
            $balance = $user->profile->deposit_balance;

            if ($uPlan->price > $balance) {

                session()->flash('message', "You don't have sufficient balance. Please deposit money first or earn money");
                Session::flash('type', 'error');
                Session::flash('title', 'Insufficient Balance');

                return redirect()->back();
            }

            $user->profile->deposit_balance = $user->profile->deposit_balance - $uPlan->price;

            $user->profile->save();

            $order = new Order();
            $order->scheme_id = $uPlan->id;
            $order->user_id = $user->id;
            $order->status = 0;
            $order->totalHit = 0;
            $order->url = $request->url;
            $order->title = $request->name;
            $order->membership_id = $request->membership;
            $order->type = 1;
            $order->save();

            session()->flash('message', 'Your Website Ads Request Has Been Successfully Submitted.');
            Session::flash('type', 'success');
            Session::flash('title', 'Request Successful');

            return redirect()->route('uPlanLog');

        } else {

            $this->validate($request, [
                'name' => 'required|min:1|max:199',
                'code' => 'required|min:1|max:4000',
            ]);
            $balance = $user->profile->deposit_balance;

            if ($uPlan->price > $balance) {

                session()->flash('message', "You don't have sufficient balance. Please deposit money first or earn money");
                Session::flash('type', 'error');
                Session::flash('title', 'Insufficient Balance');

                return redirect()->back();
            }

            $user->profile->deposit_balance = $user->profile->deposit_balance - $uPlan->price;

            $user->profile->save();
            $today = Carbon::today();

            $user->profile->deposit_balance = $user->profile->deposit_balance - $uPlan->price;

            $user->profile->save();

            $order = new UserAdvert;
            $order->name = $request->name;
            $order->advert_plan_id = $uPlan->id;
            $order->user_id = $user->id;
            $order->startTime = $today;
            $order->status = 0;
            $order->totalHit = 0;
            $order->code = $request->code;
            $order->type = 2;
            $order->save();

            session()->flash('message', 'Your Video Ads Request Has Been Successfully Submitted.');
            Session::flash('type', 'success');
            Session::flash('title', 'Request Successful');

            return redirect()->route('uPlanLog');

        }

    }

    public function uPlanLog()
    {
        $user = Auth::user();

        $logs = Order::whereUser_id($user->id)->get();

        return view('user.advert.log', compact('logs'));
    }

    public function kyc()
    {
        $user = Auth::user();

        $result1 = Kyc::whereUser_id($user->id)->first();

        $result2 = Kyc2::whereUser_id($user->id)->first();

        return view('user.kyc', compact('user', 'result1', 'result2'));
    }

    public function kycSubmit(Request $request)
    {
        $user = Auth::user();

        $this->validate($request, [

            'name' => 'required|max:25',
            'front' => 'required|image|mimes:jpg,jpeg,png,gif|max:3072',
            'number' => 'required|max:50',
            'dob' => 'required|date',

        ]);

        if ($request->hasFile('back')) {

            $this->validate($request, [

                'back' => 'required|image|mimes:jpg,jpeg,png,gif|max:3072'
            ]);

            $back = $request->back;
            $back_new_name = time() . $back->getClientOriginalName();
            $back->move('uploads/verifications', $back_new_name);

            $front = $request->front;

            $front_new_name = time() . $front->getClientOriginalName();

            $front->move('uploads/verifications', $front_new_name);

            $kyc = Kyc::create([

                'name' => $request->name,
                'user_id' => $user->id,
                'number' => $request->number,
                'back' => 'uploads/verifications/' . $back_new_name,
                'front' => 'uploads/verifications/' . $front_new_name,
                'dob' => $request->dob,
                'status' => 0,

            ]);

            $user->notify(new KYCVerifyAccept($user));

            session()->flash('message', 'Your Verify Request Has Been Successfully Submitted.');
            Session::flash('type', 'success');
            Session::flash('title', 'Request Successful');

            return redirect()->route('userKyc');

        }

        $front = $request->front;

        $front_new_name = time() . $front->getClientOriginalName();

        $front->move('uploads/verifications', $front_new_name);

        $kyc = Kyc::create([

            'name' => $request->name,
            'user_id' => $user->id,
            'number' => $request->number,
            'back' => 'img/image_placeholder.jpg',
            'front' => 'uploads/verifications/' . $front_new_name,
            'dob' => $request->dob,
            'status' => 0,

        ]);

        $user->notify(new KYCVerifyAccept($user));

        session()->flash('message', 'Your Verify Request Has Been Successfully Submitted.');
        Session::flash('type', 'success');
        Session::flash('title', 'Request Successful');

        return redirect()->route('userKyc');
    }

    public function kyc2Submit(Request $request)
    {
        $user = Auth::user();

        $this->validate($request, [

            'name' => 'required|max:25',
            'photo' => 'required|image|mimes:jpg,jpeg,png,gif|max:3072',

        ]);

        $photo = $request->photo;

        $photo_new_name = time() . $photo->getClientOriginalName();

        $photo->move('uploads/verifications', $photo_new_name);

        $kyc2 = Kyc2::create([

            'name' => $request->name,
            'user_id' => $user->id,
            'photo' => 'uploads/verifications/' . $photo_new_name,
            'status' => 0,

        ]);

        $user->notify(new KYC2VerifyAccept($user));

        session()->flash('message', 'Your Verify Request Has Been Successfully Submitted.');
        Session::flash('type', 'success');
        Session::flash('title', 'Request Successful');

        return redirect()->route('userKyc');
    }


    public function earnHistory()
    {
        $user = Auth::user();

        $earns = UserLog::whereUser_id($user->id)->orderBy('created_at', 'desc')->paginate(20);


        return view('user.history.earn', compact('earns'));
    }

    public function review()
    {
        $user = Auth::user();

        $review = Testimonial::whereUser_id($user->id)->get();

        return view('user.testimonial', compact('review'));
    }

    public function reviewPost(Request $request)
    {
        $this->validate($request, [

            'title' => 'required|min:20|max:100',
            'comment' => 'required|min:50|max:500',

        ]);

        $user = Auth::user();

        $testionial = Testimonial::create([

            'title' => $request->title,
            'comment' => $request->comment,
            'user_id' => $user->id,
            'status' => 0,

        ]);

        session()->flash('message', 'Your Review Has Been Successfully Submitted.');
        Session::flash('type', 'success');
        Session::flash('title', 'Review Successful');

        return redirect()->route('userDashboard');


    }



}
