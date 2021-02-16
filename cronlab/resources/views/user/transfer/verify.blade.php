@extends('layouts.dashboard')
@section('title', 'Balance Transfer')
@section('content')

    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header card-header-tabs" data-background-color="rose">
                    <div class="nav-tabs-navigation">
                        <div class="nav-tabs-wrapper">
                            <span class="nav-tabs-title">Balance Transfer</span>
                            <ul class="nav nav-tabs" data-tabs="tabs">
                                    <li class="active">
                                        <a href="#other" data-toggle="tab">
                                            <i class="material-icons">code</i> Balance Transfer
                                            <div class="ripple-container"></div>
                                        </a>
                                    </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <div class="card-content">
                    <h4 class="card-title text-center"><strong>We have send you a 6 digit security code to your email. Please write that 6 digit code here to confirm your transfer.</strong></h4>
                    <div class="tab-content">
                            <div class="tab-pane active" id="other">
                                <form action="{{route('userFundsTransfer.check',$transfer->reference)}}" method="post">
                                    {{ csrf_field() }}
                                    @if(count($errors) > 0)
                                        <div class="alert alert-danger alert-with-icon" data-notify="container">
                                            <i class="material-icons" data-notify="icon">notifications</i>
                                            <span data-notify="message">

                                            @foreach($errors->all() as $error)
                                                    <li><strong> {{$error}} </strong></li>
                                                @endforeach

                                        </span>
                                        </div>
                                    @endif

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group label-floating">
                                                <label  class="control-label" for="code">Write your Security Code Here</label>
                                                <input id="code" name="code" type="number" required class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <br>
                                    <a href="{{route('userDashboard')}}" class="btn btn-rose">Cancel Transfer</a>

                                    <button type="submit" class="btn btn-success pull-right">Transfer Now</button>
                                    <div class="clearfix"></div>
                                </form>
                                <br>
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1">
                                        <h5 class="card-title text-center"><strong>Didn't find any email related this? Sometimes it can take up to 15 minutes to deliver. Click the resend button to resend the security code to email. But please wait at least 15 minuets to resend. </strong></h5>
                                        <div class="col-sm-offset-5">
                                            <a href="{{route('userFundsTransfer.resend',$transfer->reference)}}" class="btn btn-info">Resend Code</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>


        </div>

        <div class="row">
            <div class="col-md-4">
                <div class="card card-content">
                    <div class="card-content">
                        <div class="alert alert-primary">
                            <h4 class="card-title text-center"><span>Your Current Balance Info</span></h4>
                        </div>

                        <div class="card card-stats">
                            <div class="card-header" data-background-color="green">
                                <i class="material-icons">done_all</i>
                            </div>
                            <div class="card-content">
                                <p class="category">{{config('app.currency_code')}}</p>
                                <h3 class="card-title">{{config('app.currency_symbol')}} {{Auth::user()->profile->main_balance + 0}}</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons text-success">eject</i> Account Balance
                                </div>
                            </div>
                        </div>


                        <div class="card card-stats">
                            <div class="card-header" data-background-color="rose">
                                <i class="material-icons">done_all</i>
                            </div>
                            <div class="card-content">
                                <p class="category">{{config('app.currency_code')}}</p>
                                <h3 class="card-title">{{config('app.currency_symbol')}} {{Auth::user()->profile->referral_balance + 0}}</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons text-success">eject</i> Referral Balance
                                </div>
                            </div>
                        </div>
                        <div class="card card-stats">
                            <div class="card-header" data-background-color="blue">
                                <i class="material-icons">done_all</i>
                            </div>
                            <div class="card-content">
                                <p class="category">{{config('app.currency_code')}}</p>
                                <h3 class="card-title">{{config('app.currency_symbol')}} {{Auth::user()->profile->deposit_balance + 0}}</h3>
                            </div>
                            <div class="card-footer">
                                <div class="stats">
                                    <i class="material-icons text-success">eject</i> Deposit Balance
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>



    </div>


@endsection