@extends('layouts.admin')

@section('title', 'Edit Advert Plan')

@section('content')


    <div class="row">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="purple">
                    <i class="material-icons">perm_identity</i>
                </div>
                <div class="card-content">
                    <h4 class="card-title">Advert Plan -
                        <small class="category">Edit Style</small>
                    </h4>

                    <form action="{{route('admin.advert.planUpdate',['id'=>$style->id])}}" method="post">
                        {{ csrf_field() }}
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
                        <br><br>


                        <div class="row">

                            <div class="col-md-12">

                                <div class="form-group">
                                    <div class="form-group label-floating">

                                        <label  class="control-label" for="name">Style Name</label>
                                        <input id="name" name="name" type="text" value="{{$style->name}}" class="form-control">

                                    </div>

                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group label-floating">
                                <select class="selectpicker" name="type" data-style="btn btn-success" title="Select Advert Plan Type" data-size="7">
                                    <option value="1"
                                            @if($style->type == 1)
                                            selected
                                            @endif
                                    >For Website Ads</option>

                                    <option value="2"
                                            @if($style->type == 2)
                                            selected
                                            @endif
                                    >For Video Ads</option>
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <div class="form-group label-floating">
                                        <label  class="control-label" for="price">Advert Plan Price (Example: 100.00)</label>
                                        <input id="price" name="price" type="text" value="{{$style->price}}" class="form-control">
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
                                        <input id="time" name="time" type="number" value="{{$style->duration}}" class="form-control">
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
                                        <input id="hit" name="hit" type="number" value="{{$style->hit}}" class="form-control">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>

                        <div class="row">
                            <div class="col-md-12">
                                <p class="text-info">Select Advert Plan Status</p>
                                <div class="form-group label-floating">
                                    <select class="selectpicker" name="status" data-style="btn btn-warning btn-round" title="Select Advert Plan Status" data-size="7">
                                        <option value="0"
                                                @if($style->status == 0)
                                                selected
                                                @endif
                                        >Not Active</option>

                                        <option value="1"
                                                @if($style->status == 1)
                                                selected
                                                @endif
                                        >Active</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <br>
                        <br><br>
                        <a href="{{route('admin.advert.planIndex')}}" class="btn btn-rose">Cancel Edit</a>
                        <button type="submit" class="btn btn-success pull-right">Update Advert Plan</button>
                        <div class="clearfix"></div>
                    </form>
                </div>
            </div>
        </div>

    </div>

@endsection
