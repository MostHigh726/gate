@extends('layouts.dashboard')
@section('title', 'My Advertisements History')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="green">
                    <i class="material-icons">payment</i>
                </div>
                <br>
                <h4 class="card-title">My Advertisements History</h4>
                <div class="card-content">
                    <br>
                    @if(count($logs) > 0)
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="text-center">SN</th>
                                    <th class="text-center">Title</th>
                                    <th class="text-center">Ad Type</th>
                                    <th class="text-center">Per Hit</th>
                                    <th class="text-center">Hit Count</th>
                                    <th class="text-center">Total Hit</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                @php $id=0;@endphp
                                @foreach($logs as $log)
                                    @php $id++;@endphp
                                    <tr>
                                        <td class="text-center">{{ $id }}</td>
                                        <td class="text-center">{{$log->title}}</td>
                                        <td class="text-center">

                                            @if($log->type == 1)
                                                Website
                                            @else
                                                Video
                                            @endif

                                        </td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{ 0}}</td>
                                        <td class="text-center">{{$log->totalHit }}</td>
                                         <td class="text-center">{{$log->ptc->hit }}</td>
                                        <td class="text-center">
                                            @if($log->turn ==null)
                                                <span class="btn btn-primary"><i class="material-icons">edit</i> Awaiting for Approval</span>

                                             @else

                                                @if($log->status == 1)
                                                    <span class="btn btn-info"><i class="material-icons">check</i>Running</span>

                                                @elseif($log->status == 2)

                                                <span class="btn btn-success"><i class="material-icons">close</i>Limit Reached</span>

                                                 @else
                                                    <span class="btn btn-rose"><i class="material-icons">close</i>Not Running</span>
                                                @endif
                                            @endif

                                        </td>
                                        <td class="text-center">
                                            <a href="{{route('pShow', $log->id)}}" type="button" rel="tooltip" class="btn btn-warning">
                                                Preview Ads
                                            </a>

                                        </td>

                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </div>

                    @else

                        <h1 class="text-center">No Don't Have any Investment Yet</h1>
                    @endif
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-5">



                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

@endsection