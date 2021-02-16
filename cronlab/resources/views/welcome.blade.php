@extends('layouts.public')

@section('title', 'Welcome to Growth Capital Investment')

@section('content')

    <body class="section-white">
<div class="cd-section" id="headers">
    <div class="header-3">
        <nav class="navbar navbar-info navbar-transparent navbar-fixed-top navbar-color-on-scroll">
        @include('includes.public.navbar')
        </nav>
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
            <div class="carousel slide" data-ride="carousel">

                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->

            @include('includes.public.slider')

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <i class="material-icons">keyboard_arrow_left</i>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <i class="material-icons">keyboard_arrow_right</i>
                </a>
            </div>
        </div>



    </div>

    <!--     *********    END HEADER 3      *********      -->
</div>



<div class="cd-section" id="features">

    <div class="container">

        <!--     *********     FEATURES 1      *********      -->

        @include('includes.public.features')

        <!--     *********    END FEATURES 1      *********      -->
    </div>
</div>

<div class="cd-section" id="pricing">
    <!--     *********    PRICING 3     *********      -->

    <div class="pricing-3 section-image" style="background-image: url('{{asset('img/city.jpg')}}');" id="pricing-3">

        @include('includes.public.price')

    </div>

    <!--     *********    END PRICING 3      *********      -->
</div>

<div class="cd-section" id="projects">
    <!--     *********    PROJECTS 4     *********      -->

    <div class="projects-4" id="projects-4">


@include('includes.public.source')


    </div>

    <!--     *********    END PROJECTS 4      *********      -->

</div>


<div class="cd-section" id="testimonials">

    <!--     *********    TESTIMONIALS 1     *********      -->

    <div class="testimonials-1 section-image" style="background-image: url('{{asset('img/dg2.jpg')}}')">


        @include('includes.public.testimonals')


    </div>

    <!--     *********    END TESTIMONIALS 1      *********      -->

</div>


<footer class="footer">


    @include('includes.public.footer')


</footer>

    @if($settings->live_chat == 1)

        @include('includes.chat')
    @endif


    </body>

@endsection