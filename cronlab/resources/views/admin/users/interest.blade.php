@extends('layouts.admin')
@section('title', 'User Interest History')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="green">
                    <i class="material-icons">payment</i>
                </div>
                <br>
                <h4 class="card-title">{{$user->name}}'s Investments Interest History</h4>
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
                                    <th>Reference</th>
                                    <th>Invest Type</th>
                                    <th>Interest Rate</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>SN</th>
                                    <th>Reference</th>
                                    <th>Invest Type</th>
                                    <th>Interest Rate</th>
                                    <th>Amount</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                @php $id=0;@endphp
                                @foreach($logs as $log)
                                    @php $id++;@endphp
                                    <tr>
                                        <td>{{ $id }}</td>
                                        <td>{{$log->reference_id}}</td>
                                        <td>{{$log->invest->plan->style->name}}</td>
                                        <td>{{$log->invest->plan->percentage +0}}%</td>
                                        <td>{{config('app.currency_symbol')}} {{$log->amount + 0 }}</td>
                                        <td>{{ date("j/ n/ Y", strtotime($log->created_at)) }}</td>
                                        <td>{{ date("g:i A", strtotime($log->created_at)) }}</td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                    @else
                        <h1 class="text-center">No Don't Have any Investment Interest Yet</h1>
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