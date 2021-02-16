@extends('layouts.dashboard')

@section('title', 'All Message From Admin')

@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="rose">
                    <i class="material-icons">contacts</i>
                </div>
                <br>
                <h4 class="card-title">All Message or Notice From Admin</h4>
                <div class="card-content">
                    <br>

                    @if(count($inboxes) > 0)

                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="text-center">SN</th>
                                    <th class="text-center">Subject</th>
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Time</th>
                                    <th class="text-center">Priority</th>
                                    <th class="text-center">View</th>
                                    <th class="text-center">Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                @php $id=0;@endphp
                                @foreach($inboxes as $inbox)
                                    @php $id++;@endphp

                                    <tr>
                                        <td class="text-center">{{ $id }}</td>
                                        <td class="text-center">{{$inbox->title}}</td>
                                        <td class="text-center">{{ date("j/ n/ Y", strtotime($inbox->created_at)) }}</td>
                                        <td class="text-center">{{ date("g:i A", strtotime($inbox->created_at)) }}</td>
                                        <td class="text-center">

                                            @if($inbox->priority == 1)
                                                Normal
                                            @elseif($inbox->priority == 2)
                                                Medium
                                            @else
                                                High
                                            @endif

                                        </td>
                                        <td class="text-center">

                                            <a href="{{route('userMessage.show', $inbox->id)}}" class="btn btn-info"
                                               type="button">

                                                Show Me

                                            </a>


                                        </td>

                                        <td class="text-center">

                                            @if($inbox->status == 1)

                                                <button class="btn btn-success">
                                        <span class="btn-label">
                                            <i class="material-icons">check</i>
                                        </span>
                                                    Already Seen
                                                </button>


                                            @else

                                                <button class="btn btn-warning">
                                        <span class="btn-label">
                                            <i class="material-icons">warning</i>
                                        </span>
                                                    Not Seen Yet
                                                </button>



                                            @endif


                                        </td>
                                    </tr>
                                @endforeach


                                </tbody>

                            </table>
                        </div>

                    @else

                        <h1 class="text-center">No Messages or Notice Yet From Admin</h1>

                    @endif

                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-5">

                            {{$inboxes->render()}}

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection