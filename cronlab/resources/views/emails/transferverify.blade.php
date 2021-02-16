<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{$data->site_name}} | Balance Transfer Verification Code</title>
</head>

<body style="background: #222533; padding: 20px; font-size: 14px; line-height: 1.43; font-family: 'Helvetica Neue', 'Segoe UI', Helvetica, Arial, sans-serif;">
<div style="max-width: 600px; margin: 0 auto; background-color: #fff; box-shadow: 0 20px 50px rgba(0,0,0,0.05);">
    <table style="width: 100%;">
        <tr>
            <td style="background-color: #fff;">
                <h2 style="text-align: center; color: #4B72FA;">{{$data->site_name}}</h2>
            </td>
        </tr>
    </table>
    <div style="padding: 60px 70px; border-top: 1px solid rgba(0,0,0,0.05);">
        <h3 style="margin-top: 0;">
            Dear {{$data->name}},
        </h3>
        <div style="color: #636363; font-size: 14px;">
            <p>
                We received a request to transfer your balance to another Account through your account.  Your security verification code is:
            </p>
        </div>
        <table style="width: 100%;">
            <tr>
                <td style="border-collapse: collapse; color: #000; font-size: 18px; font-weight: 700; letter-spacing: 2px; min-width: 160px; padding: 0 16px; text-align: center;">
                    <h3>{{$data->code}}</h3>
                </td>
            </tr>
        </table>
        <div style="color: #636363; font-size: 14px;">
            <p>
                If you did not request to transfer your balance, it is possible that someone else is trying to transfer your balance to another account. <strong>Do not forward or give this code to anyone.</strong> Here is below info about transfer request
            </p>

            <div style="background-color: #F4F4F4; margin: 20px 0px 40px;">
                <div style="padding: 20px; text-transform: uppercase; color: #8D929D; font-size: 11px; font-weight: bold; letter-spacing: 1px; text-align: center;">
                    Summary of Transfer Request:
                </div>
                <table style="border-collapse: collapse; width: 100%;">
                    <tr>
                        <td style="padding: 20px 40px; color: #111; border: 1px solid #e7e7e7; border-left: none; width: 50%;">
                            <div style="text-transform: uppercase; letter-spacing: 1px; color: #B8B8B8; font-size: 10px; font-weight: bold; margin-bottom: 3px;">
                                Receipt Email
                            </div>
                            <div style="font-weight: bold;">
                                {{$data->receipt}}
                            </div>
                        </td>
                        <td style="padding: 20px 40px; color: #111; border: 1px solid #e7e7e7; border-left: none; border-right: none;">
                            <div style="text-transform: uppercase; letter-spacing: 1px; color: #B8B8B8; font-size: 10px; font-weight: bold; margin-bottom: 3px;">
                                Total Amount
                            </div>
                            <div style="font-weight: bold; color: #8300FF;">
                                ${{$data->amount}}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 20px 40px; color: #111; border: 1px solid #e7e7e7; border-left: none; border-right: none;">
                            <div style="text-transform: uppercase; letter-spacing: 1px; color: #B8B8B8; font-size: 10px; font-weight: bold; margin-bottom: 3px;">
                                Charge
                            </div>
                            <div style="font-weight: bold; color: #D62525;">
                                ${{$data->charge}}
                            </div>
                        </td>
                        <td style="padding: 20px 40px; color: #111; border: 1px solid #e7e7e7; border-left: none; border-right: none;">
                            <div style="text-transform: uppercase; letter-spacing: 1px; color: #B8B8B8; font-size: 10px; font-weight: bold; margin-bottom: 3px;">
                                Net Amount
                            </div>
                            <div style="font-weight: bold; color: #00FFC9;">
                                ${{$data->new_amount}}
                            </div>
                        </td>
                    </tr>
                </table>
                <div style="color: #B8B8B8; font-size: 12px; padding: 30px; border-top: 1px solid #e7e7e7;">
                    Please change your password immediately by visiting your account settings on <strong>{{$data->site_name}}</strong>. We also recommend changing password on other <strong>non-{{$data->site_name}}</strong> websites if you use the same password.
                </div>
            </div>
        </div>
        <h4 style="margin-bottom: 10px;">
            Need Help?
        </h4>
        <div style="color: #A5A5A5; font-size: 12px;">
            <p>
                If you have any questions you can simply contact us at <a href="mailto:{{$data->contact}}" style="text-decoration: underline; color: #4B72FA;">{{$data->contact}}</a> by sending email.
            </p>
        </div>
    </div><div style="background-color: #F5F5F5; padding: 40px; text-align: center;">
        <div style="margin-bottom: 20px;">
            <a href="#" style="display: inline-block; margin: 0 10px;"><img alt="" src="https://control.cronlab.io/social-icons/twitter.png" style="width: 28px;"></a><a href="#" style="display: inline-block; margin: 0 10px;"><img alt="" src="https://control.cronlab.io/social-icons/facebook.png" style="width: 28px;"></a><a href="#" style="display: inline-block; margin: 0 10px;"><img alt="" src="https://control.cronlab.io/social-icons/linkedin.png" style="width: 28px;"></a><a href="#" style="display: inline-block; margin: 0 10px;"><img alt="" src="https://control.cronlab.io/social-icons/instagram.png" style="width: 28px;"></a>
        </div>
        <div style="margin-bottom: 20px;">
            <a href="#" style="text-decoration: underline; font-size: 14px; letter-spacing: 1px; margin: 0 15px; color: #261D1D;">Contact Us</a><a href="#" style="text-decoration: underline; font-size: 14px; letter-spacing: 1px; margin: 0 15px; color: #261D1D;">Privacy Policy</a><a href="#" style="text-decoration: underline; font-size: 14px; letter-spacing: 1px; margin: 0 15px; color: #261D1D;">Terms & Conditions</a>
        </div>
        <div style="color: #A5A5A5; font-size: 12px; margin-bottom: 20px; padding: 0 50px;">
            You are receiving this email because you signed up at {{$data->site_name}}. Please do not reply at his email.
        </div>
        <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid rgba(0,0,0,0.05);">
            <div style="color: #A5A5A5; font-size: 10px; margin-bottom: 5px;">
                1073 Madison Ave, suite 649, New York, NY 10001
            </div>
            <div style="color: #A5A5A5; font-size: 10px;">
                Copyright 2018 {{$data->company}}. All rights reserved.
            </div>
        </div>
    </div>
</div>
</body>
</html>
