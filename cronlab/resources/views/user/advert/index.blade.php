@extends('layouts.dashboard')
@section('title', 'Pick the best advert plan for you')
@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center">
                        <h2 class="title">Pick the best advert plan for you</h2>
                        <h5 class="description">Bigger package has Bigger Traffic Hit System and Premium Support on each package.</h5>
                    </div>
                </div>

                @if($settings->buy_traffic == 1)

                    <div class="card-content">
                        <br>
                        @if($uPlans)

                            @foreach($uPlans as $membership)

                                <div class="col-md-3">
                                    <div class="card card-pricing card-raised">
                                        <div class="card-content">
                                            <h6 class="category">{{$membership->name}}</h6>
                                            <div class="icon icon-info">
                                                <i class="material-icons">highlight</i>
                                            </div>
                                            @if($membership->type == 1)
                                                <p class="card-title text-primary">
                                                    This Package For Website Ads Only
                                                </p>
                                            @else
                                                <p class="card-title text-danger">
                                                    This Package For Video Ads Only
                                                </p>
                                            @endif

                                            <h3 class="card-title">

                                                @if($membership->price == 0)

                                                    Free

                                                @else
                                                    {{config('app.currency_symbol')}} {{$membership->price + 0}}
                                                @endif


                                            </h3>
                                            <p class="card-description">
                                                <span class="btn btn-success">Total Hit: {{$membership->hit}}</span>
                                                <span class="btn btn-info">Duration: {{$membership->duration}} sec</span>
                                            </p>

                                            <button class="btn btn-raised btn-round btn-primary" data-toggle="modal" data-target="#adModal{{$membership->id}}">
                                                Buy This Plan
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <!-- small modal -->
                                <div class="modal fade" id="adModal{{$membership->id}}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-small">
                                        <div class="modal-content">
                                            <div class="modal-header text-center">
                                                <h5>Enter Advertisement Information</h5>
                                            </div>
                                            <form action="{{route('userAdPlan.activation', $membership->id)}}" method="post">
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
                                                        <label  class="control-label" for="name">Advertisement Title</label>
                                                        <input id="name" name="name" type="text" class="form-control">
                                                    </div>
                                                    <br>
                                                    <div class="form-group label-floating">
                                                        <select class="selectpicker" name="membership" data-style="btn btn-warning btn-round" title="Target Membership" data-size="7">

                                                            @foreach($memberships as $gateway)
                                                                <option value="{{$gateway->id}}">{{$gateway->name}}</option>
                                                            @endforeach
                                                        </select>
                                                    </div>
                                                    <br>
                                                    @if($membership->type == 1)
                                                        <div class="form-group label-floating">
                                                            <label  class="control-label" for="url">Website Address</label>
                                                            <input id="url" name="url" type="url" class="form-control">
                                                        </div>
                                                    @else
                                                        <div class="form-group label-floating">
                                                            <label  class="control-label" for="code">Video Embedded Code</label>
                                                            <textarea name="code" class="form-control" id="code" rows="5"></textarea>
                                                        </div>
                                                    @endif
                                                    <br>

                                                </div>

                                                <div class="modal-footer text-center">
                                                    <button type="button" class="btn btn-simple" data-dismiss="modal">Cancel</button>
                                                    <button type="submit" class="btn btn-success btn-sm">Confirm Purchase</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <!--    end small modal -->


                            @endforeach
                        @endif

                    </div>

                @endif



            </div>
        </div>
    </div>




@endsection