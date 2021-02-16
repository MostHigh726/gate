@extends('layouts.dashboard')
@section('title', 'My Referral & Link')

@section('styles')
    <link rel="stylesheet" href="{{asset('css/hierarchy-view.css')}}">
    <link rel="stylesheet" href="{{asset('css/tree-d.css')}}">
@endsection
@section('content')

    <section class="management-hierarchy">
        <div class="hv-container">
            <div class="hv-wrapper">
                <!-- Key component -->
                <div class="hv-item">
                    <div class="hv-item-parent">
                        <div class="person">
                            <img src="{{$user->profile->avatar}}" alt="">
                            <p class="name">
                                {{$user->name}} <b>/ {{$user->profile->occupation}}</b>
                            </p>
                        </div>
                    </div>
                    @if(count($referrals) > 0)
                    <div class="hv-item-children">
                        @foreach($referrals as $referral)
                        <div class="hv-item-child">
                            <!-- Key component -->
                            <div class="hv-item">

                                <div class="hv-item-parent">
                                    <div class="person">
                                        <img src="{{$referral->user->profile->avatar}}" alt="">
                                        <p class="name">
                                            {{$referral->user->name}} <b>/ {{$user->profile->occupation}}</b>
                                        </p>
                                    </div>
                                </div>
                                @if(count($referral->childs))
                                    <div class="hv-item-children">
                                    @include('includes.dashboard.child',['childs' => $referral->childs])
                                    </div>
                                @endif

                            </div>
                        </div>
                        @endforeach
                    </div>

                    @else
                        <h1> There is no Refer You have made.</h1>

                    @endif
                </div>
            </div>
        </div>
    </section>
@endsection