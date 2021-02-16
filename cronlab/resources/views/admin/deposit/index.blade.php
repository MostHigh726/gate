@extends('layouts.admin')

@section('title', 'All User Deposit Request')

@section('content')

    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="rose">
                    <i class="material-icons">contacts</i>
                </div>
                <br>
                <h4 class="card-title">Instant Deposit Completed</h4>
                <div class="card-content">
                    <div class="toolbar">
                        <!-- Here you can write extra buttons/actions for the toolbar  -->
                    </div>
                    @if(count($deposits) > 0)
                        <div class="material-datatables">
                            <table id="datatables" class="table table-striped table-no-bordered table-hover"
                                   cellspacing="0" width="100%" style="width:100%">
                                <thead>
                                <tr>
                                    <th class="text-center">SN</th>
                                    <th class="text-center">Transaction Id</th>
                                    <th class="text-center">Gateway</th>
                                    <th class="text-center">Amount</th>
                                    <th class="text-center">Package</th>
                                    <th class="text-center">Charge</th>
                                    <th class="text-center">Funded</th>
                                    <th class="text-center">Details</th>
                                    <th class="text-center">Time</th>
                                    <th class="text-center">User</th>
                                    <th class="text-center">Status</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th class="text-center">SN</th>
                                    <th class="text-center">Transaction Id</th>
                                    <th class="text-center">Gateway</th>
                                    <th class="text-center">Amount</th>
                                    <th class="text-center">Package</th>
                                    <th class="text-center">Charge</th>
                                    <th class="text-center">Funded</th>
                                    <th class="text-center">Details</th>
                                    <th class="text-center">Time</th>
                                    <th class="text-center">User</th>
                                    <th class="text-center">Status</th>
                                </tr>
                                </tfoot>
                                <tbody>
                                @php $id=0;@endphp
                                @foreach($deposits as $deposit)
                                    @php $id++;@endphp
                                    <tr>
                                        <td class="text-center">{{ $id }}</td>
                                        <td class="text-center">{{$deposit->transaction_id}}</td>
                                        <td class="text-center">{{$deposit->gateway_name}}</td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{$deposit->amount}}</td>
                                        <td class="text-center">{{$deposit->plan_name}}</td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{$deposit->charge}}</td>
                                        <td class="text-center">{{config('app.currency_symbol')}} {{$deposit->net_amount}}</td>
                                        <td class="text-center">{{$deposit->details}}</td>
                                        <td class="text-center">{{$deposit->created_at->diffForHumans()}}</td>
                                        <td class="text-center td-actions">
                                            <a href="{{route('admin.user.show', $deposit->user->id)}}" type="button"
                                               class="btn btn-info">
                                                <i class="material-icons">edit</i> Details
                                            </a>
                                        </td>

                                        <td class="text-center td-actions">

                                            @if($deposit->status == 1)
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
                        <h1 class="text-center">Don't Have any Transfer History Yet</h1>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
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