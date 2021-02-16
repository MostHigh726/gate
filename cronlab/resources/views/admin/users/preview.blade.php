@extends('layouts.admin')

@section('title', 'Show Member Investment In Details')

@section('content')

        <div class="row">
            <div class="col-md-7 col-md-offset-2">
                <div class="card card-content">
                    <div class="card-content">
                        <div class="alert alert-success">
                            <h4 class="card-title text-center"><span>Investment Details</span></h4>
                        </div>
                        <br>
                        <h5 class="card-title"><span class="text-danger">Investment Reference ID:    </span><span
                                    class="text-primary"><b>{{$investment->reference_id}}</b></span></h5>

                        <h5 class="card-title"><span class="text-danger">Investment Created:   </span> <span
                                    class="text-primary"><b>{{ date('F jS, Y \a\t h:i a', strtotime($investment->created_at)) }}</b></span>
                        </h5>
                        <h5 class="card-title"><span class="text-danger">Investment Type:    </span><span
                                    class="text-primary"><b>{{$investment->plan->style->name}}</b></span></h5>
                        <h5 class="card-title"><span class="text-danger">Interest Rate:    </span><span
                                    class="text-primary"><b>{{$investment->plan->percentage +0}}%</b></span></h5>
                        <h5 class="card-title"><span class="text-danger">Recent Interest:    </span><span
                                    class="text-primary"><b>{{ date('F jS, Y \a\t h:i a', strtotime($interest->made_time)) }}</b></span></h5>
                        <h5 class="card-title"><span class="text-danger">Next Interest:    </span><span
                                    class="text-primary"><b>{{ date('F jS, Y \a\t h:i a', strtotime($interest->start_time)) }}</b></span></h5>
                        <h5 class="card-title"><span class="text-danger">Investment End:    </span><span
                                    class="text-primary"><b>{{ date('F jS, Y \a\t h:i a', strtotime($trialExpires)) }}</b></span></h5>
                        <h5 class="card-title"><span class="text-danger">Investment Amount:    </span><span
                                    class="text-primary"><b>${{$investment->amount +0}}</b></span></h5>
                        <h5 class="card-title"><span class="text-danger">Total Profit:    </span><span
                                    class="text-primary"><b>${{$profit +0}}</b></span></h5>
                        <div class="row">
                            <a href="{{route('admin.user.show', $investment->user->id)}}" class="btn btn-info">View User</a>
                            <a href="{{route('admin.user.show', $investment->id)}}" class="btn btn-primary">Pause Investment</a>
                            <a href="{{route('admin.user.show', $investment->id)}}" class="btn btn-danger">Stop Totally</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection
