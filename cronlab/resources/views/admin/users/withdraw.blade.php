@extends('layouts.admin')
@section('title', 'My Balance Transfer History')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="green">
                    <i class="material-icons">payment</i>
                </div>
                <br>
                <h4 class="card-title">{{$user->name}}'s Balance Withdraw History</h4>
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
                                    <th>TrX ID</th>
                                    <th>Gateway</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Amount</th>
                                    <th>Fee</th>
                                    <th>Net Amount</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>SN</th>
                                    <th>TrX ID</th>
                                    <th>Gateway</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Amount</th>
                                    <th>Fee</th>
                                    <th>Net Amount</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                @php $id=0;@endphp
                                @foreach($logs as $log)
                                    @php $id++;@endphp
                                    <tr>
                                        <td>{{$id}}</td>
                                        <td>{{$log->transaction_id}}</td>
                                        <td>{{$log->gateway_name}}</td>
                                        <td>{{ date("j/ n/ Y", strtotime($log->created_at)) }}</td>
                                        <td>{{ date("g:i A", strtotime($log->created_at)) }}</td>
                                        <td class="text-info"><strong>${{$log->amount + 0}}</strong></td>
                                        <td class="text-danger"><strong>- ${{$log->charge + 0}}</strong></td>
                                        <td class="text-success"><strong>+ ${{$log->net_amount + 0}}</strong></td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>

                    @else
                        <h1 class="text-center">Don't Have any Withdraw History Yet</h1>
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