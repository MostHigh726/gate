<?php

namespace App\Http\Controllers;
use App\Faq;
use App\Inbox;
use App\Notifications\AccountActiveSuccess;
use App\Page;
use App\Proof;
use App\Robi\CoinPayments;
use App\Testimonial;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use App\Deposit;
use App\Post;
use App\Withdraw;
use Illuminate\Http\Request;

class GuestController extends Controller
{
    //
    public function index()
    {



        $deposits= Deposit::orderBy('created_at','desc')->take(10)->get();

        $withdraws = Withdraw::orderBy('created_at','desc')->take(10)->get();
        $testimonials=Testimonial::whereStatus(1)->inRandomOrder()->take(3)->get();

        return view('welcome',compact('deposits','withdraws','testimonials'));
    }


    public function aboutMe()
    {

        return view('about');
    }
    public function demo()
    {
        $privateKey="4022b505f92f260AD338Ef2f0a429Ec6680282Ea0c5Dc4808288c5F109C25E1C";
        $publicKey="2fef93769e66b6f089411957bd2d212a05ba5162d27b792af03b76b8bc0afc74";
        $merchantID="652f5c16c6f37b8e427c536658889f69";
        $ipnSecret="KUJZIfwY4IcJZYtwY3yP";

        $cps = new CoinPayments();
        $cps->Setup($privateKey, $publicKey);

        $req = array(
            'amount' => 10.00,
            'currency1' => 'USD',
            'currency2' => 'BTC',
            'buyer_email' => 'your_buyers_email@email.com',
            'item_name' => 'Test Item/Order Description',
            'address' => '', // leave blank send to follow your settings on the Coin Settings page
            'ipn_url' => 'https://yourserver.com/ipn_handler.php',
        );
        // See https://www.coinpayments.net/apidoc-create-transaction for all of the available fields

        $result = $cps->CreateTransaction($req);
        if ($result['error'] == 'ok') {
            $le = php_sapi_name() == 'cli' ? "\n" : '<br />';
            print 'Transaction created with ID: '.$result['result']['txn_id'].$le;
            print 'Buyer should send '.sprintf('%.08f', $result['result']['amount']).' BTC'.$le;
            print 'Status URL: '.$result['result']['status_url'].$le;
        } else {
            print 'Error: '.$result['error']."\n";
        }
    }

    public function EmailContact(Request $request)
    {

        $this->validate($request, [

            'name'=> 'required|min:5|max:200',
            'subject' => 'required|min:10|max:200',
            'email' => 'required|email',
            'body' => 'required|min:200|max:3000',

        ]);

        $inbox = new Inbox();

        $inbox->name = $request->name;
        $inbox->email = $request->email;
        $inbox->subject = $request->subject;
        $inbox->details = $request->body;
        $inbox->status = 0;
        $inbox->save();


        session()->flash('message', 'Your Message Has Been Successfully Send to Support Agent.');
        Session::flash('type', 'success');
        Session::flash('title', 'Send Successful');


        return redirect()->back();

    }

    public function contact()
    {

        $faqs = Faq::all();


        return view('contact',compact('faqs'));
    }

    public function services()
    {


        return view('services');
    }


    public function tutorials()
    {

        $posts = Post::latest()->paginate(10);

        $user = User::whereAdmin(1)->first();


        return view('blog',compact('posts','user'));
    }

    public function verifyLogout()
    {

        session()->flash('message', 'Your account has been successfully created but not active yet. You have to active your account for use our service. Please check your email for verify code.');
        session()->flash('type', 'success');
        Auth::logout();

        return redirect()->route('login');
    }
    public function banned()
    {

        session()->flash('message', 'You have no longer access to your account. Your account has been terminated by security department for fraud activity.<br><br> We have captured you, So do not try to create a new account. Please contact with us to active your account again if you think it is mistakenly done by our department. Thanks for working with us.');
        session()->flash('type', 'danger');
        Auth::logout();

        return redirect()->route('login');
    }
    public function proof()
    {


        $withdraws = Withdraw::orderBy('created_at','desc')->paginate(30);


        return view('proof',compact('withdraws'));
    }

    public function verify($token)
    {

        $user = User::where('token',$token)->firstOrfail();

        $user->token = null;
        $user->active = 1;
        $user->save();

        $user->notify(new AccountActiveSuccess($user));

        session()->flash('message', 'Your Email Address Has Been Successfully Verified.');
        Session::flash('type', 'success');
        Session::flash('title', 'Verified Successful');


        return redirect()->route('userDashboard');
    }


    public function tutorialView($slug)
    {

        $post = Post::where('slug',$slug)->first();
        $user = User::whereAdmin(1)->first();

        return view('blogview', compact('post','user'));
    }

    public function pageView($slug)
    {

        $page = Page::where('slug',$slug)->first();

        return view('singlepage',compact('page'));
    }

}
