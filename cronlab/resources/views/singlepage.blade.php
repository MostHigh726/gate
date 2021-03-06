@extends('layouts.public')

@section('title', $page->title)

@section('content')


    <body class="section-white">
    <div class="cd-section" id="headers">
        <div class="header-1">
            <nav class="navbar navbar-info navbar-transparent navbar-fixed-top navbar-color-on-scroll">
                @include('includes.public.navbar')
            </nav>
            <div class="page-header header-filter" style="background-image: url('{{asset('img/bg12.jpg')}}');">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <h1 class="title">Get Paid to Surf</h1>
                            <h4>Are you ready to start making money online with little effort? We are an ideal get-paid-to website that you can trust. We have been around for a while and we actually pay! Don't waste your time with scam sites, join Growth Capital Investment GCI today and start earning real cash now!</h4>
                            <br />

                            @if (Auth::check())

                                <a href="#" target="_blank" class="btn btn-success btn-lg">
                                    <i class="fa fa-ticket"></i> View Ads Now
                                </a>

                            @else


                                <a href="{{url('/register')}}" target="_self" class="btn btn-primary btn-lg">
                                    <i class="fa fa-ticket"></i> Join Now
                                </a>


                            @endif

                        </div>

                        @if(env('BLOG_YOUTUBE_EMBED_CODE'))

                            <div class="col-md-5 col-md-offset-1">
                                <div class="iframe-container">
                                    <iframe src="https://www.youtube.com/embed/{{env('BLOG_YOUTUBE_EMBED_CODE')}}?modestbranding=1&amp;autohide=1&amp;showinfo=0" frameborder="0" allowfullscreen height="250"></iframe>
                                </div>
                            </div>

                        @else


                        @endif


                    </div>
                </div>
            </div>

        </div>

        <!--     *********    END HEADER 3      *********      -->
    </div>

    <div class="main main-raised">
        <div class="container">
            <div class="section section-text">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h3 class="title">{{$page->title}}</h3>
                        <p>Last Update {{$page->updated_at->diffForHumans()}}</p>
                        <br>

                        {!! $page->content !!}

                    </div>
                </div>
            </div>



        </div>
    </div>


    <footer class="footer">


        @include('includes.public.footer')


    </footer>

    </body>

@endsection