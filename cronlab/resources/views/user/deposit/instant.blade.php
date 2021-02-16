@extends('layouts.dashboard')
@section('title', 'Cash in balance to your account')
@section('content')


        <div class="row">

            <div class="col-md-8 col-md-offset-2">
                <div class="card card-content">
                    <div class="card-content">
                        <div class="alert alert-info">
                                <span> You have been select <b>{{$gateway->name}}</b>. Please note that <b>{{$gateway->name}}</b> will be charge you <b>{{config('app.currency_symbol')}} {{$gateway->fixed}}</b> fixed + <b>{{$gateway->percent}}%</b> fee in every deposit.</span>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <h4><span class="text-primary">Current Balance: </span><span class="text-danger"><b>{{config('app.currency_symbol')}} {{$user->profile->deposit_balance +0}}</b></span></h4>
                                <h4><span class="text-primary">Your  Amount: </span><span class="text-danger"><b>{{config('app.currency_symbol')}} {{$deposit->amount +0}}</b></span></h4>
                                <h4><span class="text-primary">Gateway Charge: </span><span class="text-danger"><b>{{config('app.currency_symbol')}} {{$deposit->charge + 0}}</b></span></h4>
                                <h4><span class="text-primary">Amount + Charge: </span><span class="text-danger"><b>{{config('app.currency_symbol')}} {{($deposit-> net_amount + $deposit->charge) + 0}}</b></span></h4>
                            </div>
                            <div class="col-md-6">
                                <br><br>
                                <h3><span class="text-primary">Reference Code: </span><span class="text-danger"><b>{{$deposit->code}}</b></span></h3>

                            </div>
                            <div class="col-sm-6 col-sm-offset-4">
                                <button class="btn btn-raised btn-success" data-toggle="modal" data-target="#instant">
                                   Confirm
                                </button>
                            </div>
                            <div class="modal fade" id="instant" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-small ">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="material-icons">clear</i></button>
                                        </div>
                                        <div class="modal-body text-center">
                                            @if($gateway->id == 3)
                                            <h5>Please Select Your Crypto Currency and Click Yes </h5>
                                            @else
                                                <h5>Are you sure you want to do this? </h5>
                                            @endif
                                        </div>
                                        <div class="modal-footer text-center">

                                            @if($gateway->id == 1)

                                            <form action="{{route('PayPalConfirm')}}" method="post">
                                                {{csrf_field()}}
                                                <input type="hidden" name="cmd" value="_xclick">
                                                <input type="hidden" name="business" value="robi@cronlab.io">
                                                <input type="hidden" name="item_name" value="Instant Deposit">
                                                <input type="hidden" name="item_number" value="{{$deposit->code}}">
                                                <input type="hidden" name="tax" value="1">
                                                <input type="hidden" name="quantity" value="1">
                                                <input type="hidden" name="amount" value="{{$deposit->amount}}">
                                                <input type="hidden" name="custom" value="{{$user->id}}">
                                                <input type="hidden" name="currency_code" value="{{config('app.currency_code')}}">
                                                <button type="button" class="btn btn-simple" data-dismiss="modal">No</button>
                                                <button type="submit" name="upload" class="btn btn-success btn-simple">Yes</button>
                                            </form>

                                             @elseif($gateway->id == 2)

                                                <form action="{{route('stripeConfirm')}}" method="POST">
                                                    {{csrf_field()}}
                                                    <script
                                                            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                                            data-key="{{$gateway->val1}}"
                                                            data-amount="{{$deposit->amount * 100}}"
                                                            data-name="{{config('app.name')}}"
                                                            data-description="Fill With Valid Card Info"
                                                            data-image="https://stripe.com/img/documentation/checkout/marketplace.png"
                                                            data-locale="en"
                                                            data-currency="{{config('app.currency_code')}}">
                                                    </script>
                                                    <input type="hidden" name="code" value="{{$deposit->code}}">
                                                    <input type="hidden" name="amount" value="{{$deposit->amount}}">
                                                    <input type="hidden" name="user_id" value="{{$user->id}}">
                                                </form>
                                            @elseif($gateway->id == 3)

                                                <form action="{{route('cryptoConfirm')}}" method="POST">
                                                    {{csrf_field()}}
                                                    <div class="col-sm-10 col-sm-offset-2">
                                                        <select class="selectpicker" name="currency" data-style="btn btn-danger">
                                                            <option value="BTC" selected>BTC (BitCoin) </option>
                                                            <option value="BCH">Bitcoin Cash (BCH) </option>
                                                            <option value="LTC">LiteCoin (LTC) </option>
                                                            <option value="ETH">Ethereum (ETH) </option>
                                                            <option value="ZEC">Zcash (ZEC) </option>
                                                            <option value="DASH">Dash (DASH) </option>
                                                            <option value="XRP">Ripple (XRP) </option>
                                                            <option value="XMR">Monero (XMR) </option>
                                                            <option value="NEO">NEO (NEO) </option>
                                                            <option value="ADA">Cardano (ADA) </option>
                                                            <option value="EOS">EOS (EOS) </option>
                                                        </select>
                                                    </div>
                                                    <input type="hidden" name="code" value="{{$deposit->code}}">
                                                    <input type="hidden" name="amount" value="{{$deposit->amount}}">
                                                    <input type="hidden" name="nothing" value="{{$user->id}}">
                                                    <br><br> <br><br>
                                                    <button type="button" class="btn btn-simple" data-dismiss="modal">No</button>
                                                    <button type="submit" name="upload" class="btn btn-success btn-simple">Yes</button>
                                                </form>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="alert alert-primary">

                        </div>





                    </div>

                </div>
            </div>


        </div>




@endsection