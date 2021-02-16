<?php

/*
|--------------------------------------------------------------------------
| Web Routes For Public
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


use App\Deposit;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Auth;

Auth::routes();
Route::get('/', 'GuestController@index')->name('welcome');

Route::get('/verify/logout', 'GuestController@verifyLogout')->name('verifyLogout');

Route::get('/banned/logout', 'GuestController@banned')->name('bannedLogout');


Route::get('/verify/user/{token}', 'GuestController@verify')->name('verify');

Route::get('/contact-us', 'GuestController@contact')->name('contact');

Route::post('/contact-us', 'GuestController@EmailContact')->name('GuestEmail');

Route::get('/payment-proof', 'GuestController@proof')->name('paymentProof');

Route::get('/blog', 'GuestController@tutorials')->name('tutorials');

Route::get('/view/post/{slug}', 'GuestController@tutorialView')->name('viewPost');

Route::get('/{slug}', 'GuestController@PageView')->name('viewPage');

/*
|--------------------------------------------------------------------------
| Web Routes For Admin
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware'=>['admin', 'ban']], function (){


    Route::get('admin/dashboard', 'AdminController@index')->middleware('verify')->name('adminIndex');

    Route::get('admin/mail/inbox', 'AdminEmailController@index')->name('adminEmail');
    Route::get('admin/mail/view/{id}', 'AdminEmailController@show')->name('adminEmail.show');
    Route::get('admin/email/compose', 'AdminEmailController@create')->name('adminEmail.create');
    Route::get('admin/message/compose', 'AdminEmailController@message')->name('adminMessage.create');
    Route::post('admin/message/send', 'AdminEmailController@store')->name('adminMessage.send');
    Route::post('admin/send/mail', 'AdminEmailController@send')->name('adminEmail.send');


    Route::get('admin/users', ['uses' => 'AdminUsersController@index','as' => 'admin.users.index']);
    Route::get('admin/unverified/users', ['uses' => 'AdminUsersController@unverified','as' => 'admin.users.unverified']);
    Route::get('admin/verified/users', ['uses' => 'AdminUsersController@verified','as' => 'admin.users.verified']);
    Route::get('admin/banned/users', ['uses' => 'AdminUsersController@banned','as' => 'admin.users.banned']);
    Route::get('admin/user/create', ['uses' => 'AdminUsersController@create','as' => 'admin.user.create']);
    Route::get('admin/user/edit/{id}', ['uses' => 'AdminUsersController@edit','as' => 'admin.user.edit']);
    Route::get('admin/user/show/{id}', ['uses' => 'AdminUsersController@show','as' => 'admin.user.show']);

    Route::get('admin/user/investment/show/{id}', 'AdminUsersController@investment')->name('admin.user.invest');
    Route::get('admin/user/interest/show/{id}', 'AdminUsersController@interest')->name('admin.user.interest');
    Route::get('admin/user/cashlinks/show/{id}', 'AdminUsersController@cashLinks')->name('admin.user.ptc');
    Route::get('admin/user/cashvideos/show/{id}', 'AdminUsersController@cashVideos')->name('admin.user.ppv');
    Route::post('admin/user/suspend/{id}', 'AdminUsersController@suspend')->name('admin.user.ban');
    Route::get('admin/user/active/{id}', 'AdminUsersController@unSuspend')->name('admin.users.active');
    Route::get('admin/user/investment/details/{id}', 'AdminUsersController@details')->name('admin.user.investDetails');
    Route::get('admin/user/linkshare/show/{id}', 'AdminUsersController@LinkShare')->name('admin.user.share');
    Route::get('admin/user/transfer/show/{id}', 'AdminUsersController@transfer')->name('admin.user.transfer');
    Route::get('admin/user/deposit/show/{id}', 'AdminUsersController@deposit')->name('admin.user.deposit');
    Route::get('admin/user/withdraw/show/{id}', 'AdminUsersController@withdraw')->name('admin.user.withdraw');


    Route::get('admin/user/referral/show/{id}', ['uses' => 'AdminUsersController@referral','as' => 'admin.user.referShow']);
    Route::get('admin/user/delete/{id}', ['uses' => 'AdminUsersController@destroy','as' => 'admin.user.delete']);
    Route::post('admin/user/update/{id}', ['uses' => 'AdminUsersController@update','as' => 'admin.user.update']);
    Route::post('admin/user/create/store', ['uses' => 'AdminUsersController@store','as' => 'admin.user.store']);
    Route::get('admin/user/create/admin/{id}', ['uses' => 'AdminUsersController@admin','as' => 'admin.create.admin']);
    Route::get('admin/user/remove/admin/{id}', ['uses' => 'AdminUsersController@adminRemove','as' => 'admin.remove.admin']);
    Route::resource('admin/posts', 'AdminPostsController',['names'=>[

        'index'=>'admin.posts.index',
        'create'=>'admin.post.create',
        'store'=>'admin.posts.store',
        'edit'=>'admin.posts.edit'

    ]]);

    Route::get('admin/posts/delete/{id}', ['uses' => 'AdminPostsController@destroy','as' => 'admin.posts.delete']);
    Route::post('admin/posts/update/{id}', ['uses' => 'AdminPostsController@update', 'as' => 'admin.posts.update']);
    Route::get('admin/trash/posts', ['uses' => 'AdminPostsController@trashed', 'as' => 'admin.posts.tIndex']);
    Route::get('admin/kill/post/{id}', ['uses' => 'AdminPostsController@kill', 'as' => 'admin.post.kill']);
    Route::get('admin/restore/post/{id}', ['uses' => 'AdminPostsController@restore', 'as' => 'admin.post.restore']);
    Route::resource('admin/categories', 'AdminCategoriesController',['names'=>[

        'index'=>'admin.category.index',
        'create'=>'admin.category.create',
        'store'=>'admin.category.store',
        'edit'=>'admin.category.edit'
    ]]);

    Route::post('admin/categories/update/{id}', ['uses' => 'AdminCategoriesController@update', 'as' => 'admin.category.update']);
    Route::get('admin/categories/delete/{id}', ['uses' => 'AdminCategoriesController@destroy', 'as' => 'admin.category.delete']);

    Route::get('admin/tags', ['uses' => 'AdminTagsController@index', 'as' => 'admin.tags.index']);
    Route::get('admin/tag/edit/{id}', ['uses' => 'AdminTagsController@edit', 'as' => 'admin.tag.edit']);
    Route::post('admin/tag/update/{id}', ['uses' => 'AdminTagsController@update', 'as' => 'admin.tag.update']);
    Route::post('admin/tag/store', ['uses' => 'AdminTagsController@store', 'as' => 'admin.tag.store']);
    Route::get('admin/tag/delete/{id}', ['uses' => 'AdminTagsController@destroy', 'as' => 'admin.tag.destroy']);


    Route::get('admin/website/pages', ['uses' => 'AdminPagesController@index', 'as' => 'adminPages']);
    Route::get('admin/website/page/edit/{id}', ['uses' => 'AdminPagesController@edit', 'as' => 'adminPage.edit']);
    Route::post('admin/website/page/update/{id}', ['uses' => 'AdminPagesController@update', 'as' => 'adminPage.update']);
    Route::get('admin/website/page/publish/{id}', ['uses' => 'AdminPagesController@publish', 'as' => 'adminPage.Publish']);
    Route::get('admin/website/page/unpublish/{id}', ['uses' => 'AdminPagesController@unPublish', 'as' => 'adminPage.unPublish']);

    Route::get('admin/memberships', ['uses' => 'AdminMembershipController@index', 'as' => 'admin.memberships.index']);
    Route::get('admin/membership/create', ['uses' => 'AdminMembershipController@create', 'as' => 'admin.membership.create']);
    Route::get('admin/membership/edit/{id}', ['uses' => 'AdminMembershipController@edit', 'as' => 'admin.membership.edit']);
    Route::get('admin/membership/delete/{id}', ['uses' => 'AdminMembershipController@destroy', 'as' => 'admin.membership.delete']);
    Route::post('admin/membership/store', ['uses' => 'AdminMembershipController@store', 'as' => 'admin.membership.store']);
    Route::post('admin/membership/update/{id}', ['uses' => 'AdminMembershipController@update', 'as' => 'admin.membership.update']);


    Route::get('admin/ptc', ['uses' => 'AdminPTCController@index', 'as' => 'admin.ptcs.index']);
    Route::get('admin/ptc/create', ['uses' => 'AdminPTCController@create', 'as' => 'admin.ptc.create']);
    Route::post('admin/ptc/create', ['uses' => 'AdminPTCController@store', 'as' => 'admin.ptc.store']);
    Route::get('admin/ptc/delete/{id}', ['uses' => 'AdminPTCController@destroy', 'as' => 'admin.ptc.delete']);
    Route::get('admin/ptc/edit/{id}', ['uses' => 'AdminPTCController@edit', 'as' => 'admin.ptc.edit']);
    Route::post('admin/ptc/update/{id}', ['uses' => 'AdminPTCController@update', 'as' => 'admin.ptc.update']);
    Route::get('admin/ptc/preview/{id}', ['uses' => 'AdminPTCController@preview', 'as' => 'admin.ptc.preview']);

    Route::get('admin/link/share', ['uses' => 'AdminLinkController@index', 'as' => 'admin.link.index']);
    Route::get('admin/link/share/create', ['uses' => 'AdminLinkController@create', 'as' => 'admin.link.create']);
    Route::post('admin/link/share/create', ['uses' => 'AdminLinkController@store', 'as' => 'admin.link.store']);
    Route::get('admin/link/share/delete/{id}', ['uses' => 'AdminLinkController@destroy', 'as' => 'admin.link.delete']);
    Route::get('admin/link/share/edit/{id}', ['uses' => 'AdminLinkController@edit', 'as' => 'admin.link.edit']);
    Route::post('admin/link/share/update/{id}', ['uses' => 'AdminLinkController@update', 'as' => 'admin.link.update']);

    Route::get('admin/ppv', ['uses' => 'AdminPPVController@index', 'as' => 'admin.ppvs.index']);
    Route::get('admin/ppv/create', ['uses' => 'AdminPPVController@create', 'as' => 'admin.ppv.create']);
    Route::post('admin/ppv/create', ['uses' => 'AdminPPVController@store', 'as' => 'admin.ppv.store']);
    Route::get('admin/ppv/delete/{id}', ['uses' => 'AdminPPVController@destroy', 'as' => 'admin.ppv.delete']);
    Route::get('admin/ppv/edit/{id}', ['uses' => 'AdminPPVController@edit', 'as' => 'admin.ppv.edit']);
    Route::post('admin/ppv/update/{id}', ['uses' => 'AdminPPVController@update', 'as' => 'admin.ppv.update']);

    Route::get('admin/advert/plan', ['uses' => 'AdminAdvertPlanController@index', 'as' => 'admin.advert.planIndex']);
    Route::post('admin/advert/plan/store', ['uses' => 'AdminAdvertPlanController@store', 'as' => 'admin.advert.planStore']);
    Route::get('admin/advert/plan/edit/{id}', ['uses' => 'AdminAdvertPlanController@edit', 'as' => 'admin.advert.planEdit']);
    Route::post('admin/advert/plan/update/{id}', ['uses' => 'AdminAdvertPlanController@update', 'as' => 'admin.advert.planUpdate']);
    Route::get('admin/advert/plan/destroy/{id}', ['uses' => 'AdminAdvertPlanController@destroy', 'as' => 'admin.advert.planDestroy']);
    Route::get('admin/user/advert/request', ['uses' => 'AdminAdvertPlanController@request', 'as' => 'admin.user.advert']);
    Route::get('admin/user/advert/request/approve/{id}', ['uses' => 'AdminAdvertPlanController@approve', 'as' => 'admin.user.advertAp']);
    Route::get('admin/user/adverts', ['uses' => 'AdminAdvertPlanController@allAds', 'as' => 'admin.user.advertAll']);
    Route::get('admin/user/advert/pause/{id}', ['uses' => 'AdminAdvertPlanController@pause', 'as' => 'admin.user.advertPR']);
    Route::get('admin/user/advert/edit/{id}', ['uses' => 'AdminAdvertPlanController@orderEdit', 'as' => 'admin.user.advertEdit']);
    Route::post('admin/user/advert/submit/edit/{id}', ['uses' => 'AdminAdvertPlanController@orderEditsubmit', 'as' => 'admin.user.advertEditSubmit']);


    Route::get('admin/gateways', ['uses' => 'AdminGatewaysController@index', 'as' => 'admin.gateways.index']);
    Route::get('admin/gateway/edit/{id}', ['uses' => 'AdminGatewaysController@edit', 'as' => 'admin.gateway.edit']);
    Route::get('admin/gateway/delete/{id}', ['uses' => 'AdminGatewaysController@destroy', 'as' => 'admin.gateway.delete']);
    Route::post('admin/gateway/update/{id}', ['uses' => 'AdminGatewaysController@update', 'as' => 'admin.gateway.update']);


    Route::get('admin/local/gateways', ['uses' => 'AdminGatewaysController@localIndex', 'as' => 'admin.gateways.local']);
    Route::get('admin/local/gateway/edit/{id}', ['uses' => 'AdminGatewaysController@localEdit', 'as' => 'admin.local.edit']);
    Route::get('admin/local/gateway/delete/{id}', ['uses' => 'AdminGatewaysController@localDestroy', 'as' => 'admin.local.delete']);
    Route::post('admin/local/gateway/update/{id}', ['uses' => 'AdminGatewaysController@localUpdate', 'as' => 'admin.local.update']);
    Route::post('admin/local/gateway/create', ['uses' => 'AdminGatewaysController@localStore', 'as' => 'admin.local.store']);
    Route::get('admin/local/gateway/create', ['uses' => 'AdminGatewaysController@localCreate', 'as' => 'admin.local.create']);




    Route::get('admin/kyc/identity', 'AdminKYCController@kyc')->name('adminKyc');
    Route::get('admin/kyc/address', 'AdminKYCController@kyc2')->name('adminKyc2');
    Route::get('admin/kyc/show/data/{id}', 'AdminKYCController@show')->name('adminKycShow');
    Route::get('admin/kyc2/show/data/{id}', 'AdminKYCController@show2')->name('adminKyc2Show');
    Route::get('admin/kyc/identity/verify/accept/{id}', 'AdminKYCController@KycAccept')->name('adminKycAccept');
    Route::get('admin/kyc/identity/verify/reject/{id}', 'AdminKYCController@KycReject')->name('adminKycReject');
    Route::get('admin/kyc/address/verify/accept/{id}', 'AdminKYCController@Kyc2Accept')->name('adminKyc2Accept');
    Route::get('admin/kyc/address/verify/reject/{id}', 'AdminKYCController@Kyc2Reject')->name('adminKyc2Reject');

    Route::get('admin/user/reviews', 'AdminController@review')->name('adminReview');
    Route::get('admin/user/review/publish/{id}', 'AdminController@reviewPublish')->name('adminReview.accept');
    Route::get('admin/user/review/un-publish/{id}', 'AdminController@reviewUnPublish')->name('adminReview.reject');


    Route::get('admin/users/deposit', ['uses' => 'AdminController@userDeposits', 'as' => 'admin.users.deposit']);
    Route::get('admin/users/deposit/local', ['uses' => 'AdminController@localDeposits', 'as' => 'admin.deposit.local']);
    Route::get('admin/users/deposit/local/update/{id}', ['uses' => 'AdminController@localDepositsUpdate', 'as' => 'admin.deposit.update']);
    Route::get('admin/users/deposit/local/fraud/{id}', ['uses' => 'AdminController@localDepositsFraud', 'as' => 'admin.deposit.fraud']);

    Route::get('admin/users/withdraws', ['uses' => 'AdminController@userWithdraws', 'as' => 'admin.users.withdraws']);
    Route::get('admin/users/withdraws/request', ['uses' => 'AdminController@userWithdrawsRequest', 'as' => 'admin.withdraws.request']);
    Route::get('admin/users/withdraw/update/{id}', ['uses' => 'AdminController@payment', 'as' => 'admin.withdraw.update']);
    Route::get('admin/users/withdraw/fraud/{id}', ['uses' => 'AdminController@withdrawFraud', 'as' => 'admin.withdraw.fraud']);

    Route::get('admin/invest/style', 'AdminStyleController@index')->name('adminStyle');
    Route::post('admin/invest/style', 'AdminStyleController@store')->name('adminStyle.post');
    Route::get('admin/invest/style/edit/{id}', 'AdminStyleController@edit')->name('adminStyle.edit');
    Route::post('admin/invest/style/update/{id}', 'AdminStyleController@update')->name('adminStyle.update');
    Route::get('admin/invest/style/delete/{id}', 'AdminStyleController@destroy')->name('adminStyle.delete');

    Route::get('admin/invest/plan', 'AdminInvestController@index')->name('adminInvest');
    Route::get('admin/invest/plan/create', 'AdminInvestController@create')->name('adminInvest.create');
    Route::post('admin/invest/plan', 'AdminInvestController@store')->name('adminInvest.post');
    Route::get('admin/invest/plan/edit/{id}', 'AdminInvestController@edit')->name('adminInvest.edit');
    Route::post('admin/invest/plan/update/{id}', 'AdminInvestController@update')->name('adminInvest.update');
    Route::get('admin/invest/plan/delete/{id}', 'AdminInvestController@destroy')->name('adminInvest.delete');


    Route::get('admin/faqs/index', 'AdminFAQController@index')->name('adminFAQ');
    Route::get('admin/faq/edit/{id}', 'AdminFAQController@edit')->name('adminFAQEdit');
    Route::post('admin/faq/update/{id}', 'AdminFAQController@update')->name('adminFAQUpdate');
    Route::post('admin/faq/create', 'AdminFAQController@store')->name('adminFAQStore');
    Route::get('admin/faq/delete/{id}', 'AdminFAQController@destroy')->name('adminFAQDestroy');

    Route::get('admin/user/supports', 'AdminSupportController@open')->name('adminSupports.open');
    Route::get('admin/user/supports/close', 'AdminSupportController@index')->name('adminSupports.index');
    Route::get('admin/user/support/ticket/view/{ticket}', 'AdminSupportController@show')->name('adminSupport.view');
    Route::post('admin/user/support/create/{ticket}', 'AdminSupportController@store')->name('adminSupport.post');


    Route::get('admin/website/settings', 'SettingsController@index')->name('websiteSettings');
    Route::post('admin/website/settings/general/update/{id}', 'SettingsController@generalSettings')->name('generalSettings');
    Route::post('admin/website/settings/features/update/{id}', 'SettingsController@featuresSettings')->name('featuresSettings');
    Route::post('admin/website/settings/users/update/{id}', 'SettingsController@usersSettings')->name('usersSettings');

});

/*
|--------------------------------------------------------------------------
| Web Routes for user
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware'=>['auth', 'ban']], function (){

    Route::get('user/dashboard', 'HomeController@index')->name('userDashboard');
    Route::get('user/daily/rewards', 'HomeController@daily')->name('userDailyBonus');
    Route::get('user/message', 'HomeController@message')->name('userMessage');
    Route::get('user/message/{id}', 'HomeController@messageShow')->name('userMessage.show');
    Route::get('user/message/attachment/download/{id}', 'HomeController@messageDown')->name('userMessage.download');
    Route::get('user/kyc', 'HomeController@kyc')->name('userKyc');
    Route::post('user/kyc', 'HomeController@kycSubmit')->name('userKyc.submit');
    Route::post('user/kyc2', 'HomeController@kyc2Submit')->name('userKyc2.submit');

    Route::get('user/profile', 'UserProfileController@index')->name('userProfile');
    Route::post('user/profile', 'UserProfileController@update')->name('userProfile.update');

    Route::get('user/advertisements/plan', 'HomeController@uPlan')->name('userAdPlan');
    Route::post('user/advertisements/plan/active/{id}', 'HomeController@uPlanActive')->name('userAdPlan.activation');
    Route::get('user/advertisements/history', 'HomeController@uPlanLog')->name('uPlanLog');
    Route::get('user/advertisements/preview/{id}', 'HomeController@pShow')->name('pShow');

    Route::get('user/cash/links', 'UserAdvertsController@cashLinks')->name('userCash.links');
    Route::get('user/cash/link/show/{id}', 'UserAdvertsController@cashLinkShow')->name('userCashLinks.show');
    Route::get('user/cash/link/confirm/{id}', 'UserAdvertsController@cashLinkConfirm')->name('userCashLink.confirm');

    Route::get('user/cash/videos', 'UserAdvertsController@cashVideos')->name('userCash.videos');
    Route::get('user/cash/video/show/{id}', 'UserAdvertsController@cashVideoShow')->name('userCashVideo.show');
    Route::get('user/cash/video/confirm/{id}', 'UserAdvertsController@cashVideoConfirm')->name('userCashVideo.confirm');

    Route::get('user/deposits', 'UserDepositsController@index')->name('userDeposits');
    Route::post('user/deposit/preview', 'UserDepositsController@paymentPreview')->name('userPaymentPreview');
    Route::post('user/deposit/preview/instant', 'UserDepositsController@instantPreview')->name('instantPreview');
    Route::post('user/deposit/off/confirm', 'UserDepositsController@offline')->name('userDepConfirm');
    Route::post('user/deposit/stripe/confirm', 'UserDepositsController@stripeConfirm')->name('stripeConfirm');
    Route::post('user/deposit/crypto/confirm', 'UserDepositsController@cryptoConfirm')->name('cryptoConfirm');
    Route::post('user/deposit/PayPal/confirm', 'UserDepositsController@PayPalConfirm')->name('PayPalConfirm');
    Route::get('user/deposit/create', 'UserDepositsController@create')->name('userDeposit.create');
    Route::post('user/deposit/create', 'UserDepositsController@postPayment')->name('userDeposit.post');
    Route::post('user/local/deposit/create', 'UserDepositsController@create')->name('userDeposit.local');

    Route::get('user/paypal/payment/status', 'UserDepositsController@getPaypalStatus')->name('userDepositPayPal.status');

    Route::get('user/funds/transfer', 'UserFundsTransferController@index')->name('userFundsTransfer');
    Route::get('user/funds/transfer/history', 'UserFundsTransferController@history')->name('userFundsTransfer.history');
    Route::post('user/funds/transfer', 'UserFundsTransferController@self')->name('userFundsTransfer.self');
    Route::post('user/funds/transfer/others', 'UserFundsTransferController@others')->name('userFundsTransfer.others');
    Route::get('user/funds/transfer/verify/{reference}', 'UserFundsTransferController@verify')->name('userFundsTransfer.verify');
    Route::post('user/funds/transfer/verify/{reference}', 'UserFundsTransferController@check')->name('userFundsTransfer.check');
    Route::get('user/funds/transfer/verify/resend/{reference}', 'UserFundsTransferController@resend')->name('userFundsTransfer.resend');


    Route::get('user/withdraws', 'UserWithdrawsController@index')->name('userWithdraws');
    Route::get('user/withdraws/create', 'UserWithdrawsController@create')->name('userWithdraw.create');
    Route::post('user/withdraws/create', 'UserWithdrawsController@postWithdraw')->name('userWithdraw.post');

    Route::get('user/memberships', 'UserMembershipsController@index')->name('userMemberships');
    Route::get('user/membership/upgrade/{id}', 'UserMembershipsController@upgrade')->name('userMembership.upgrade');

    Route::get('user/referrals', 'UsersReferralController@index')->name('userReferrals');
    Route::get('user/referrals/new', 'UsersReferralController@newRefer')->name('userReferrals.new');
    Route::get('user/earning/history', 'HomeController@earnHistory')->name('userEarns');


    Route::get('user/review', 'HomeController@review')->name('userReview');
    Route::post('user/review', 'HomeController@reviewPost')->name('userReview.post');

    Route::get('user/investments/history', 'UserInterestController@investHistory')->name('userInvest.history');
    Route::get('user/interests/history', 'UserInterestController@interestHistory')->name('userInterest.history');

    Route::get('user/investments', 'UserInterestController@index')->name('userInvestments');
    Route::post('user/investments', 'UserInterestController@submit')->name('userInvestment.submit');
    Route::post('user/investment/order/confirm/', 'UserInterestController@confirm')->name('userInvestment.confirm');


    Route::get('user/supports', 'UserSupportsController@index')->name('userSupports');
    Route::get('user/support/ticket/view/{ticket}', 'UserSupportsController@show')->name('userSupport.view');
    Route::get('user/support/create', 'UserSupportsController@create')->name('userSupport.create');
    Route::get('user/support/ticket/close/{id}', 'UserSupportsController@close')->name('userSupport.close');
    Route::post('user/support/create', 'UserSupportsController@store')->name('userSupport.post');
    Route::post('user/message/create/{ticket}', 'UserSupportsController@message')->name('userMessage.post');

    Route::get('user/link/shares', 'UserAdvertsController@shareLinks')->name('userLink.share');
    Route::get('user/cash/link/show/{id}', 'UserAdvertsController@cashLinkShow')->name('userCashLinks.show');
    Route::get('user/save/share/{id}', 'UserAdvertsController@save_share')->name('fbShare');

});

Route::post('/crypto/payment/status', 'UserDepositsController@cryptoStatus')->name('userDepositCrypto');

//Route::get('/api/verify', 'ApiController@verify');
//Route::get('/api/index', 'ApiController@index');