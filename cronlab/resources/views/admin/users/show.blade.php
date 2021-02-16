@extends('layouts.admin')

@section('title', 'Show Member Profile & Activity Summery')

@section('content')

        <div class="row">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header card-header-icon" data-background-color="blue">
                        <i class="material-icons">perm_identity</i>
                    </div>
                    <div class="card-content">
                        <h4 class="card-title">Show Member Profile-
                            <small class="category">Summery Member Activity</small>
                        </h4>

                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail">
                                        <img src="{{asset($user->profile->avatar)}}" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                </div>
                            </div>
                        </div>

                        <div class="row">

                            <div class="col-md-6">

                                <div class="form-group label-floating">

                                    <label class="control-label" for="name">Full Name</label>
                                    <input id="name" name="name" type="text" value="{{$user->name}}"
                                           class="form-control" disabled>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="email">Email Address</label>
                                    <input id="email" name="email" value="{{$user->email}}" type="text"
                                           class="form-control" disabled>
                                </div>
                            </div>

                        </div>
                        <div class="row">

                            <div class="col-md-6">

                                <div class="form-group label-floating">
                                    <label class="control-label" for="occupation">Occupation</label>
                                    <input id="occupation" name="occupation" type="text"
                                           value="{{$user->profile->occupation}}" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="mobile">Mobile Number</label>
                                    <input id="mobile" name="mobile" type="text" value="{{$user->profile->mobile}}"
                                           class="form-control" disabled>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="main_balance">Main Balance</label>
                                    <input id="main_balance" name="main_balance"
                                           value="{{$user->profile->main_balance}}" type="number" class="form-control"
                                           disabled>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="deposit_balance">Deposit Balance</label>
                                    <input id="deposit_balance" name="deposit_balance"
                                           value="{{$user->profile->deposit_balance}}" type="number"
                                           class="form-control" disabled>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="referral_balance">Referral Balance</label>
                                    <input id="referral_balance" name="referral_balance"
                                           value="{{$user->profile->referral_balance}}" type="number"
                                           class="form-control" disabled>

                                </div>
                            </div>


                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="address">Address Line 1</label>
                                    <input id="address" name="address" value="{{$user->profile->address}}" type="text"
                                           class="form-control" disabled>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="address2">Address Line 2</label>
                                    <input id="address2" name="address2" value="{{$user->profile->address2}}"
                                           type="text" class="form-control" disabled>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="city">City</label>
                                    <input id="city" name="city" type="text" value="{{$user->profile->city}}"
                                           class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="state">State</label>
                                    <input id="state" name="state" type="text" value="{{$user->profile->state}}"
                                           class="form-control" disabled>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="postcode">Postal Code</label>
                                    <input id="postcode" name="postcode" type="text"
                                           value="{{$user->profile->postcode}}" class="form-control" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="row">

                            <div class="col-md-4">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="country">Member Country</label>
                                    <input id="country" name="country" type="text" value="{{$user->profile->country}}"
                                           class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group label-floating">
                                    <label class="control-label" for="facebookurl">Facebook Profile Url</label>
                                    <input id="facebookurl" name="facebook" type="text"
                                           value="{{$user->profile->facebook}}" class="form-control" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-group label-floating">
                                        <label class="control-label" for="about">About</label>
                                        <input id="about" name="about" type="text" value="{{$user->profile->about}}"
                                               class="form-control" disabled>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="{{route('admin.users.index')}}" class="btn btn-success">Back</a>
                        <a href="{{route('admin.user.edit', $user->id)}}" class="btn btn-rose">Edit</a>

                        @if($user->ban == 1)
                            <a href="{{route('admin.users.active', $user->id)}}" class="btn btn-primary">Un-Suspend</a>

                        @else
                            <button class="btn btn-raised btn-danger" disabled>Un-Suspend</button>
                        @endif


                        @if($user->ban == 0)

                        <button class="btn btn-raised btn-danger" data-toggle="modal" data-target="#suspend">
                           Suspend
                        </button>
                        <!-- small modal -->
                        <div class="modal fade" id="suspend" tabindex="-1" role="dialog" aria-labelledby="suspend" aria-hidden="true">
                            <div class="modal-dialog modal-small ">
                                <div class="modal-content">
                                    <div class="modal-header text-center">
                                        <h5>Before Suspend This Member Please Write Reason for Later Use</h5>
                                    </div>
                                    <form action="{{route('admin.user.ban',$user->id)}}" method="post">
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

                                        <div class="modal-body">
                                            <div class="form-group label-floating">
                                                <label  class="control-label" for="note">Suspend Reason</label>
                                                <input id="note" name="note" type="text" class="form-control">
                                            </div>
                                        </div>

                                        <div class="modal-footer text-center">
                                            <button type="button" class="btn btn-simple" data-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-success btn-sm">Confirm</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!--    end small modal -->
                        @else
                            <button class="btn btn-raised btn-danger" disabled>Suspend</button>
                        @endif

                        <div class="clearfix"></div>

                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="card card-content">
                        <div class="card-content">
                            <div class="alert alert-success">
                                <h4 class="card-title text-center"><span>User Summary</span></h4>
                            </div>
                            <br>
                            <h5 class="card-title"><span class="text-danger">Joining Date:   </span> <span
                                        class="text-primary"><b>{{ date('F jS, Y \a\t h:i a', strtotime($user->created_at)) }}</b></span>
                            </h5>
                            <h5 class="card-title"><span class="text-danger">Membership Name:    </span><span
                                        class="text-primary"><b>{{$user->membership->name}}</b></span></h5>
                            <h5 class="card-title"><span class="text-danger">Membership Started:    </span><span
                                        class="text-primary"><b>{{ date('F jS, Y ', strtotime($user->membership_started)) }}</b></span></h5>
                            <h5 class="card-title"><span class="text-danger">Membership Expired:    </span><span
                                        class="text-primary"><b>{{ date('F jS, Y ', strtotime($user->membership_expired)) }}</b></span></h5>
                            <h5 class="card-title"><span class="text-danger">Referrer Name:    </span><span
                                        class="text-primary"><b>

                                         @if( $upliner == 1)
                                            {{$referrer->name}}
                                        @else
                                            No One Refer Him
                                        @endif

                                    </b></span></h5>
                            <h5 class="card-title"><span class="text-danger">Total Referral:    </span><span
                                        class="text-primary"><b>  @if(count($totalRefer) > 0)
                                            {{count($totalRefer)}}
                                        @else
                                            Didn't Made Any Refer Yet
                                        @endif</b></span></h5>
                            <h5 class="card-title"><span class="text-danger">Total Investment:    </span><span
                                        class="text-primary"><b>${{$invest + 0}}</b></span></h5>

                            <h5 class="card-title"><span class="text-danger">Total Interest:    </span><span
                                        class="text-primary"><b>${{$interest + 0}}</b></span></h5>

                            <h5 class="card-title"><span class="text-danger">Total PTC Earn:    </span><span
                                        class="text-primary"><b>${{$ptc + 0}}</b></span></h5>

                            <h5 class="card-title"><span class="text-danger">Total PPV Earn:    </span><span
                                        class="text-primary"><b>${{$ppv + 0}}</b></span></h5>
                            <div class="row">

                                @if( $upliner == 1)
                                    <a href="{{route('admin.user.show', $referrer->id)}}" class="btn btn-success">View Referer</a>
                                @else
                                    <button class="btn btn-success" disabled>View Referer</button>
                                @endif
                                    @if(count($totalRefer) > 0)
                                        <a href="{{route('admin.user.referShow', $user->id)}}" class="btn btn-info">View Referral</a>
                                    @else
                                        <button class="btn btn-info" disabled>View Referral</button>
                                    @endif
                                    <a href="{{route('admin.user.invest', $user->id)}}" class="btn btn-rose">View Investment</a>
                                    <a href="{{route('admin.user.interest', $user->id)}}" class="btn btn-warning">View Interest</a>
                                    <a href="{{route('admin.user.ptc', $user->id)}}" class="btn btn-primary">View CashLink</a>
                                    <a href="{{route('admin.user.ppv', $user->id)}}" class="btn btn-info">View CashVideo</a>
                                    <a href="{{route('admin.user.share', $user->id)}}" class="btn btn-info">View LinkShare</a>
                                    <a href="{{route('admin.user.transfer', $user->id)}}" class="btn btn-warning">View Transfer</a>
                                    <a href="{{route('admin.user.deposit', $user->id)}}" class="btn btn-primary">View Deposit</a>
                                    <a href="{{route('admin.user.withdraw', $user->id)}}" class="btn btn-primary">View Withdraw</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection
