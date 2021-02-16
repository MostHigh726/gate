@extends('layouts.admin')
@section('title', 'User Link Share Earning History')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="green">
                    <i class="material-icons">payment</i>
                </div>
                <br>
                <h4 class="card-title">{{$user->name}}'s Link Share Earning History</h4>
                <div class="card-content">
                    <div class="toolbar">
                        <!-- Here you can write extra buttons/actions for the toolbar  -->
                    </div>
                    @if(count($logs) > 0)
                        <div class="material-datatables">
                            <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>Title</th>
                                    <th>Visit</th>
                                    <th>Rewards</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>SN</th>
                                    <th>Title</th>
                                    <th>Visit</th>
                                    <th>Rewards</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Status</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                @php $id=0;@endphp
                                @foreach($logs as $log)
                                    @php $id++;@endphp
                                    <tr>
                                        <td>{{ $id }}</td>
                                        <td>{{$log->link->title}}</td>
                                        <td><a href="{{$log->link->link}}" class="btn btn-info btn-sm">Ad URL</a></td>
                                        <td>{{config('app.currency_symbol')}} {{$log->link->rewards + 0 }}</td>
                                        <td>{{ date("j/ n/ Y", strtotime($log->updated_at)) }}</td>
                                        <td>{{ date("g:i A", strtotime($log->updated_at)) }}</td>
                                        <td>
                                            @if($log->status == 0)
                                                <span class="btn btn-primary btn-sm"><i class="material-icons">edit</i> Not Viewed</span>
                                            @else
                                                <span class="btn btn-success btn-sm"><i class="material-icons">edit</i> Viewed</span>
                                            @endif
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    @else
                        <h1 class="text-center">This Member Didn't Shared Any Links Yet</h1>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function() {
            $('#datatables').DataTable({
                "pagingType": "full_numbers",
                "lengthMenu": [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ],
                responsive: true,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search records",
                }
            });
        });
    </script>

@endsection