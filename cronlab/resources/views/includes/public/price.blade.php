

<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 text-center">
            <h2 class="title">Choose your desire Plan to invest</h2>
            <h5 class="description">Our all Payouts are fully Automatic , Here You make withdrawal when you require, our system automatically sent the profit direct to your account through which you have nvested Here.</h5>
            <div class="section-space"></div>
        </div>
    </div>

    <div class="row">

        <div class="col-md-4 ">
            <div class="card card-pricing card-raised">
                <div class="card-content content-primary">
                    <h6 class="category">Basic</h6>
                    <h2 class="card-title"><small>{{config('app.currency_symbol')}} </small>100 -<small>{{config('app.currency_symbol')}} </small>10,000 </h2>
                    <ul>
                        <li><b>12%</b> Money Return</li>
                        <li>Deposit Included In Payment</li>
                        <li> 3 times Reinvestment Available</li>
                        <li>Profit Accrual of 24 hours</li>
                    </ul>

                    @if(Auth::guest())
                    <a href="{{route('register')}}" class="btn btn-white btn-round">
                        Get Started
                    </a>
                    @else
                        <a href="" class="btn btn-white btn-round">
                            Get Started
                        </a>
                    @endif
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-pricing card-raised">
                <div class="card-content content-info">
                    <h6 class="category text-info">Gold</h6>
                    <h2 class="card-title"><small>{{config('app.currency_symbol')}} </small>1000 - <small>{{config('app.currency_symbol')}} </small>100,000</h2>
                    <ul>
                        <li><b>1%</b> Money Return</li>
                        <li>Deposit Included In Payment</li>
                        <li>23 times Reinvestment Available</li>
                        <li>Profit Accrual in 60 minuites</li>
                    </ul>
                    @if(Auth::guest())
                        <a href="{{route('register')}}" class="btn btn-white btn-round">
                            Get Started
                        </a>
                    @else
                        <a href="" class="btn btn-white btn-round">
                            Get Started
                        </a>
                    @endif
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card card-pricing card-raised">
                <div class="card-content content-success">
                    <h6 class="category text-info">Diamond</h6>
                    <h1 class="card-title"><small>{{config('app.currency_symbol')}} </small>7,000 - <small>{{config('app.currency_symbol')}} </small>up</h1>
                    <ul>
                        <li><b>50%</b> Money Return</li>
                        <li>Deposit Included In Payment</li>
                        <li> unlimited Reinvestment Available</li>
                        <li>Profit Accrual in 12 hours</li>
                    </ul>
                    @if(Auth::guest())
                        <a href="{{route('register')}}" class="btn btn-white btn-round">
                            Get Started
                        </a>
                    @else
                        <a href="" class="btn btn-white btn-round">
                            Get Started
                        </a>
                    @endif
                </div>
            </div>
        </div>

    </div>

</div>