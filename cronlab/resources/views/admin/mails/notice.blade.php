@extends('layouts.admin')

@section('title', 'Send Message To User')

@section('styles')
    <!-- include summernote css/js -->
    <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>

@endsection

@section('content')


    <div class="row">
        <div class="col-md-9 col-md-offset-1">
            <div class="card">
                <div class="card-header card-header-icon" data-background-color="green">
                    <i class="material-icons">email</i>
                </div>
                <div class="card-content">
                    <h4 class="card-title">Send Message Section -
                        <small class="category">Send Message or Make Notice to Your Website User</small>
                    </h4>

                    <div class="alert alert-info">
                        <p class="text-center">
                            This message box supported HTML Tag & Markdown Content. For more details click : <br>
                            <a href="https://summernote.org/" target="_blank">HTML Editor</a> <br>
                            <a href="https://dillinger.io/" target="_blank">Markdown Editor</a> <br>
                        </p>
                    </div>
                    <div class="alert alert-danger">
                        <p class="text-center">
                            You can send email to multiple address at a time. Please write your multiple email address
                            like <br><strong>"robi@gmail.com,robi2@gmail.com,robi3@gmail.com"</strong>. <br>
                            Note: Please don't add any space after comma like <strong>"robi@gmail.com, robi2@gmail.com,
                                robi3@gmail.com"</strong>.
                        </p>
                    </div>
                    <form action="{{route('adminMessage.send')}}" role="form" id="contact-form" method="POST"
                          enctype="multipart/form-data">
                        {{csrf_field()}}
                        <div class="card-content">
                            @if(count($errors) > 0)
                                <div class="alert alert-danger alert-with-icon" data-notify="container">
                                    <i class="material-icons" data-notify="icon">notifications</i>
                                    <span data-notify="message">
                                                        @foreach($errors->all() as $error)
                                            <li><strong> {{$error}} </strong></li>
                                        @endforeach
                                                    </span>
                                </div>
                                <br>
                            @endif
                            <div class="row">
                                <div class="form-group label-floating">
                                    <select class="selectpicker" name="status" data-style="btn btn-success btn-round"
                                            title="Select Message Receiver Status" data-size="7">
                                        <option value="1">One User</option>
                                        <option value="2">All User</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group label-floating">
                                <label for="email" class="control-label">Send To</label>
                                <input type="email" id="email" name="email" class="form-control">
                            </div>
                            <br>
                            <div class="col-md-offset-3">
                                <div class="fileinput fileinput-new text-center" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail">
                                        <img src="{{asset('img/image_placeholder.jpg')}}" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail"></div>
                                    <div>
                                                    <span class="btn btn-rose btn-round btn-file">
                                                        <span class="fileinput-new">Select File</span>
                                                        <span class="fileinput-exists">Change</span>
                                                        <input type="file" name="featured"/>
                                                    </span>
                                        <a href="#" class="btn btn-danger btn-round fileinput-exists"
                                           data-dismiss="fileinput"><i class="fa fa-times"></i> Remove</a>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group label-floating">
                                <label for="subject" class="control-label">Subject</label>
                                <input type="text" id="subject" name="subject" class="form-control">
                            </div>
                            <br>
                            <div class="row">
                                <div class="form-group label-floating">
                                    <select class="selectpicker" name="priority" data-style="btn btn-success btn-round"
                                            title="Select Message Priority Status" data-size="7">
                                        <option value="1">Normal</option>
                                        <option value="2">Medium</option>
                                        <option value="3">High</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="form-group label-floating">
                                <label for="editor" class="control-label">Your message</label>
                                <textarea name="body" class="form-control" id="editor" rows="10"></textarea>
                            </div>

                            <div class="row">
                                <div class="col-md-7">
                                    <button type="submit" class="btn btn-primary pull-right">Send Message</button>
                                </div>
                            </div>
                        </div>

                    </form>


                </div>
            </div>
        </div>

    </div>

@endsection

@section('scripts')
    <script>
        ClassicEditor
            .create(document.querySelector('#editor'))
            .catch(error => {
                console.error(error);
            });
    </script>
@endsection