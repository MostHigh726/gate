<div class="ct-topbar">
  <div class="container">
  <ul class="list-unstyled list-inline ct-topbar__list">
    <li class="ct-language">Language <i class="fa fa-arrow-down"></i>
    <ul class="list-unstyled ct-language__dropdown">
      <li><a href="#googtrans(en|en)" class="lang-en lang-select" data-lang="en"><img src="https://www.solodev.com/assets/google-translate/flag-usa.png" alt="USA"></a></li>
      <li><a href="#googtrans(en|es)" class="lang-es lang-select" data-lang="es"><img src="https://www.solodev.com/assets/google-translate/flag-mexico.png" alt="MEXICO"></a></li>
      <li><a href="#googtrans(en|fr)" class="lang-es lang-select" data-lang="fr"><img src="https://www.solodev.com/assets/google-translate/flag-france.png" alt="FRANCE"></a></li>
      <li><a href="#googtrans(en|zh-CN)" class="lang-es lang-select" data-lang="zh-CN"><img src="https://www.solodev.com/assets/google-translate/flag-china.png" alt="CHINA"></a></li>
      <li><a href="#googtrans(en|ja)" class="lang-es lang-select" data-lang="ja"><img src="https://www.solodev.com/assets/google-translate/flag-japan.png" alt="JAPAN"></a></li>
    </ul>
    </li>
  </ul>
  </div>
</div>

    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{{config('app.url')}}"><i class="material-icons">home</i> {{config('app.name')}}</a>
        </div>

        <div class="collapse navbar-collapse">

            <ul class="nav navbar-nav navbar-right">

                @if (Auth::guest())
                    <li><a href="{{ url('/blog') }}"> <i class="material-icons">question_answer</i> Latest News</a></li>
                    <li><a href="{{ url('/contact-us') }}"> <i class="material-icons">contact_mail</i> Contact Us</a></li>
                    <li><a href="{{ route('login') }}"> <i class="material-icons">fingerprint</i> Login</a></li>
                    <li><a href="{{ route('register') }}"><i class="material-icons">subscriptions</i> Register</a></li>
                @else
                    <li>
                        <a href="{{ url('/blog') }}">
                            <i class="material-icons">question_answer</i>
                            Latest News
                        </a>
                    </li>
                    <li><a href="{{ url('/contact-us') }}"> <i class="material-icons">contact_mail</i> Contact Us</a></li>
                    <li>
                        <a href="{{ url('/user/dashboard') }}"> <i class="material-icons">dashboard</i> Dashboard </a>
                    </li>
                    <li>
                        <div class="dropdown">
                            <a href="#" class="btn btn-success dropdown-toggle" data-toggle="dropdown">
                                {{ Auth::user()->name }}
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">

                                <li>
                                    <a href="{{ route('userProfile') }}"> <i class="material-icons">explicit</i> Edit Profile </a>
                                </li>

                                <li>
                                    <a href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();"><i class="material-icons">https</i>
                                        Logout
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </li>
                @endif

            </ul>

        </div>
    </div>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script type="text/javascript">
    function googleTranslateElementInit() {
      new google.translate.TranslateElement({pageLanguage: 'en', layout: google.translate.TranslateElement.FloatPosition.TOP_LEFT}, 'google_translate_element');
    }

    function triggerHtmlEvent(element, eventName) {
      var event;
      if (document.createEvent) {
        event = document.createEvent('HTMLEvents');
        event.initEvent(eventName, true, true);
        element.dispatchEvent(event);
      } else {
        event = document.createEventObject();
        event.eventType = eventName;
        element.fireEvent('on' + event.eventType, event);
      }
    }

    jQuery('.lang-select').click(function() {
      var theLang = jQuery(this).attr('data-lang');
      jQuery('.goog-te-combo').val(theLang);

      window.location = jQuery(this).attr('href');
      location.reload();
    });
</script>
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
