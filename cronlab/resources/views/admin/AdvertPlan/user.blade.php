@extends('layouts.admin')
@section('title', 'All User Advertisements')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="green">
                    <i class="material-icons">payment</i>
                </div>
                <br>
                <h4 class="card-title">All User Advertisements</h4>
                <div class="card-content">
                    <br>
                    @if(count($logs) >0)
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="text-center">SN</th>
                                    <th class="text-center">Title</th>
                                    <th class="text-center">Type</th>
                                    <th class="text-center">Price</th>
                                    <th class="text-center">Hit</th>
                                    <th class="text-center">Request</th>
                                    <th class="text-center">User</th>
                                    <th class="text-center">URL</th>
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
                                            @elseif($log->type == 2)
                                                Video
                                            @else
                                                Link Share
                                            @endif

                                        </td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{$log->scheme->price + 0}}</td>
                                        <td class="text-center">{{$log->scheme->hit }}</td>
                                        <td class="text-center">{{ date("j/ n/ Y", strtotime($log->created_at)) }}</td>
                                        <td class="text-center td-actions">
                                            <a href="{{route('admin.user.show', $log->user->id)}}" type="button"
                                               rel="tooltip" class="btn btn-rose btn-raised">Details</a>
                                        </td>
                                        <td class="text-center td-actions">
                                            <a href="{{route('pShow', $log->id)}}" type="button" rel="tooltip" class="btn btn-warning">
                                                Preview
                                            </a>
                                        </td>
                                        <td class="text-center td-actions">
                                            @if($log->status == 1)

                                                <span class="btn btn-success">Running</span>

                                            @elseif($log->status == 0)
                                                <span class="btn btn-success">Paused</span>
                                            @else
                                                <span class="btn btn-danger">Stopped</span>
                                            @endif

                                        </td>
                                        <td class="text-center td-actions">
                                            <a href="{{route('admin.user.advertEdit', $log->id)}}" type="button" rel="tooltip" class="btn btn-info">
                                               Edit
                                            </a>

                                            @if($log->status == 1)

                                            <a href="{{route('admin.user.advertPR', $log->id)}}" type="button" rel="tooltip" class="btn btn-danger">
                                                Pause It
                                            </a>
                                            @elseif($log->status == 0)
                                                <a href="{{route('admin.user.advertPR', $log->id)}}" type="button" rel="tooltip" class="btn btn-primary">
                                                    Resume It
                                                </a>
                                             @else
                                                <span class="btn btn-danger">Limit Reached</span>
                                            @endif

                                        </td>

                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </div>

                    @else

                        <h1 class="text-center">No Don't Have any User Ads Request Yet</h1>
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