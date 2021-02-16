@extends('layouts.admin')

@section('title', 'All Advert Plan or Create Advert Plan')


@section('content')

    <div class="row">

        <div class="col-md-7">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="rose">
                    <i class="material-icons">contacts</i>
                </div>
                <br>
                <h4 class="card-title">All Advert Plan</h4>
                <div class="card-content">
                    <br>


                    <div class="table-responsive">

                        <table class="table">
                            <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Name</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Hit</th>
                                <th class="text-center">Type</th>
                                <th class="text-center">Action</th>
                            </tr>
                            </thead>
                            <tbody>

                            @if($styles)
                                @foreach($styles as $style)

                                    <tr>
                                        <td class="text-center">{{$style->id}}</td>
                                        <td class="text-center">{{$style->name}}</td>
                                        <td class="text-center">{{$style->price}}</td>
                                        <td class="text-center">{{$style->hit}}</td>
                                        <td class="text-center">
                                            @if($style->type == 1)
                                                For Website
                                            @else
                                                For Video
                                            @endif

                                        </td>
                                        <td class="text-center td-actions">
                                            <a href="{{route('admin.advert.planEdit', $style->id)}}" type="button" rel="tooltip" class="btn btn-success">
                                                <i class="material-icons">edit</i>
                                            </a>

                                            <a href="{{route('admin.advert.planDestroy', $style->id)}}" type="button" rel="tooltip" class="btn btn-danger">
                                                <i class="material-icons">close</i>
                                            </a>

                                        </td>
                                    </tr>
                                @endforeach

                            @endif

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="rose">
                    <i class="material-icons">contacts</i>
                </div>
                <br>
                <h4 class="card-title"> or Create Advert Plan Style</h4>
                <div class="card-content">
                    <br>

                    <form class="m-form" action="{{route('admin.advert.planStore')}}" method="post">

                        {{csrf_field()}}
                        @if(count($errors) > 0)
                            <div class="alert alert-danger alert-with-icon" data-notify="container">
                                <i class="material-icons" data-notify="icon">notifications</i>
                                <span data-notify="message">

                                    @foreach($errors->all() as $error)
                                        <li><strong> {{$error}} </strong></li>
                                    @endforeach

                            </span>
                            </div>
                        @endif
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-group label-floating">
                                        <label  class="control-label" for="name">Style Name</label>
                                        <input id="name" name="name" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        <div class="form-group label-floating">
                            <select class="selectpicker" name="type" data-style="btn btn-warning btn-round" title="Select Advert Plan Type" data-size="7">
                                <option value="1">For Website Ads</option>
                                <option value="2">For For Video Ads</option>
                            </select>
                        </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-group label-floating">
                                        <label  class="control-label" for="price">Advert Plan Price (Example: 100.00)</label>
                                        <input id="price" name="price" type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-group label-floating">
                                        <label  class="control-label" for="time">Advert Duration (in Seconds, Example: 60)</label>
                                        <input id="time" name="time" type="number" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-group label-floating">
                                        <label  class="control-label" for="hit">Website Traffic Hit (Example: 10000)</label>
                                        <input id="hit" name="hit" type="number" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <button type="submit" class="btn btn-success pull-right">Create Invest Style</button>

                        <div class="clearfix"></div>
                    </form>
                </div>
            </div>
        </div>

    </div>

@endsection
