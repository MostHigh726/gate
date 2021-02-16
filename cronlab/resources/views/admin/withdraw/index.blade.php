@extends('layouts.admin')
@section('title', 'All User Completed Withdraws')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="green">
                    <i class="material-icons">payment</i>
                </div>
                <br>
                <h4 class="card-title">All User Completed Withdraws</h4>
                <div class="card-content">
                    <div class="toolbar">
                        <!-- Here you can write extra buttons/actions for the toolbar  -->
                    </div>
                    @if(count($withdraws) > 0)
                        <div class="material-datatables">
                            <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                <thead>
                                <tr>
                                    <th>SN</th>
                                    <th>Gateway</th>
                                    <th>Amount</th>
                                    <th>Charge</th>
                                    <th>Need to Send</th>
                                    <th>Account</th>
                                    <th>Requested</th>
                                    <th>User</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>SN</th>
                                    <th>Gateway</th>
                                    <th>Amount</th>
                                    <th>Charge</th>
                                    <th>Account</th>
                                    <th>Requested</th>
                                    <th>User</th>
                                    <th>Status</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                @php $id=0;@endphp
                                @foreach($withdraws as $withdraw)
                                    @php $id++;@endphp
                                    <tr>
                                        <td class="text-center">{{ $id }}</td>
                                        <td class="text-center">{{$withdraw->gateway_name}}</td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{$withdraw->amount}}</td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{$withdraw->charge}}</td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{$withdraw->net_amount}}</td>
                                        <td class="text-center">{{$withdraw->account}}</td>
                                        <td class="text-center">{{$withdraw->created_at->diffForHumans()}}</td>
                                        <td class="text-center td-actions">
                                            <a href="{{route('admin.user.show', $withdraw->user->id)}}" type="button"
                                               class="btn btn-info">
                                                <i class="material-icons">edit</i> Details
                                            </a>
                                        </td>

                                        <td class="text-center td-actions">

                                            @if($withdraw->status == 1)
                                                <button class="btn btn-success btn-sm">
                                        <span class="btn-label">
                                            <i class="material-icons">check</i>
                                        </span>Completed
                                                </button>

                                            @else

                                                <button class="btn btn-primary btn-sm">
                                        <span class="btn-label">
                                            <i class="material-icons">warning</i>
                                        </span>
                                                    Pending
                                                </button>
                                            @endif

                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>

                    @else
                        <h1 class="text-center">Don't Have any Completed Withdraw Yet</h1>
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