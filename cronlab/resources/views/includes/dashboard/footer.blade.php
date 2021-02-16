<div class="container-fluid">
    <nav class="pull-left">
        <ul>
            <li>
                <a href="{{route('contact')}}">
                    Contact Us
                </a>
            </li>
            @if($aml->status == 1)
                <li>
                    <a href="{{route('viewPage', $aml->slug)}}">
                        AML Policy
                    </a>
                </li>
            @endif
            @if($kyc->status == 1)
                <li>
                    <a href="{{route('viewPage', $kyc->slug)}}">
                        KYC Policy
                    </a>
                </li>
            @endif
            @if($pp->status == 1)
                <li>
                    <a href="{{route('viewPage', $pp->slug)}}">
                        Privacy Policy
                    </a>
                </li>
            @endif
            @if($tos->status == 1)
                <li>
                    <a href="{{route('viewPage', $tos->slug)}}">
                        Terms and Conditions
                    </a>
                </li>
            @endif
            @if($settings->payment_proof == 1)
                <li>
                    <a href="{{route('paymentProof')}}">
                        Proof
                    </a>
                </li>
            @endif
        </ul>
    </nav>
    <p class="copyright pull-right">
        &copy; By {{$settings->site_name}} {{ date('Y') }}. Developed By <i class="fa fa-heart heart"></i> <a href="{{config('app.dev_url')}}">{{config('app.dev_company')}}</a>
    </p>
</div>