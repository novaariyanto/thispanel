<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| URI ROUTING
| -------------------------------------------------------------------------
| This file lets you re-map URI requests to specific controller functions.
|
| Typically there is a one-to-one relationship between a URL string
| and its corresponding controller class/method. The segments in a
| URL normally follow this pattern:
|
|	example.com/class/method/id/
|
| In some instances, however, you may want to remap this relationship
| so that a different class/function is called than the one
| corresponding to the URL.
|
| Please see the user guide for complete details:
|
|	https://codeigniter.com/user_guide/general/routing.html
|
| -------------------------------------------------------------------------
| RESERVED ROUTES
| -------------------------------------------------------------------------
|
| There are three reserved routes:
|
|	$route['default_controller'] = 'welcome';
|
| This route indicates which controller class should be loaded if the
| URI contains no data. In the above example, the "welcome" class
| would be loaded.
|
|	$route['404_override'] = 'errors/page_missing';
|
| This route will tell the Router which controller/method to use if those
| provided in the URL cannot be matched to a valid route.
|
|	$route['translate_uri_dashes'] = FALSE;
|
| This is not exactly a route, but allows you to automatically route
| controller and method names that contain dashes. '-' isn't a valid
| class or method name character, so it requires translation.
| When you set this option to TRUE, it will replace ALL dashes in the
| controller and method URI segments.
|
| Examples:	my-controller/index	-> my_controller/index
|		my-controller/my-method	-> my_controller/my_method
*/
$route['dashboard'] = 'dashboard';


$route['login'] = 'auth/login';
$route['register']='registers/signup';



$route['user'] = 'admin/user';
$route['user/add'] = 'admin/user/add';
$route['user/insert'] = 'admin/user/insert';
$route['user/delete/(:any)'] = 'admin/user/delete/$1';

$route['webhook'] = 'client/webhook';
$route['webhook/add'] = 'client/webhook/add';
$route['webhook/(:any)'] = 'client/webhook/edit/$1';
$route['webhook/delete/(:any)'] = 'client/webhook/delete/$1';

$route['autoreply'] = 'client/autoreply';
$route['autoreply/add'] = 'client/autoreply/add';
$route['autoreply/(:any)'] = 'client/autoreply/edit/$1';
$route['autoreply/delete/(:any)'] = 'client/autoreply/delete/$1';

$route['device'] = 'client/device';
$route['device/add'] = 'client/device/add';
$route['device/insert'] = 'client/device/insert';
$route['device/edit/(:any)'] = 'client/device/edit/$1';
$route['device/authqr/(:any)'] = 'client/device/authQr/$1';
$route['device/detail/(:any)'] = 'client/device/getQR/$1';
$route['device/logout/(:any)'] = 'client/device/logoutInstance/$1';
$route['device/delete/(:any)'] = 'client/device/delete/$1';

$route['messageOut'] = 'client/message';
$route['messageOut/add'] = 'client/message/add';

$route['messageIn'] = 'client/messageIn';

$route['bulk'] = 'client/bulk';
$route['bulk/add'] = 'client/bulk/add';
$route['bulk/delete/(:any)'] = 'client/bulk/delete/$1';
$route['bulk/(:any)'] = 'client/bulk/edit/$1';
$route['bulk/detail/(:any)'] = 'client/bulk/detail/$1';


$route['group'] = 'client/group';
$route['group/add'] = 'client/group/add';
$route['group/(:any)'] = 'client/group/edit/$1';
$route['group/delete/(:any)'] = 'client/group/delete/$1';


$route['contact'] = 'client/contact';
$route['contact/add'] = 'client/contact/add';
$route['contact/import'] = 'client/contact/import';
$route['contact/edit/(:any)/(:any)'] = 'client/contact/edit/$1/$2';
$route['contact/delete/(:any)/(:any)'] = 'client/contact/delete/$1/$2';

$route['billing_panel'] = 'super_admin/transaksi';
$route['billing_panel/add'] = 'super_admin/transaksi/add';

$route['transactions'] = 'admin/transaksi';
$route['billings'] = 'client/transaksi';
// $route['billing/proses/(:any)'] = 'client/transaksi/proses/$1';
$route['billing/invoice/(:any)'] = 'client/transaksi/invoice/$1';

$route['service'] = 'client/service';
$route['service/addUptime'] ='client/service/addUptime';
$route['change_package']='client/service/change_package';
$route['save_change_package/(:any)']='client/service/save_change_package/$1';

$route['setting'] = 'super_admin/setting';

$route['packages'] = 'admin/package';
$route['package/add'] = 'admin/package/add';
$route['package/edit/(:any)'] = 'admin/package/edit/$1';
$route['package/delete/(:any)'] = 'admin/package/delete/$1';

$route['api/device/detail/(:any)'] = 'api/devices/getQR/$1';
$route['api/device/generateQrs'] = 'api/devices/generateQr';

$route['api/device/resetInstance'] = 'api/devices/resetInstance';
$route['api/device/statusInstance'] = 'api/devices/statusInstance';
$route['api/device/add'] = 'api/devices/adding';



$route['api'] = 'api/messages';
$route['api/sendMessageText'] = 'api/messages/sendMessageText';
$route['api/sendMessageTextbc'] = 'api/messages/sendMessageTextbc';

$route['api/sendImageUrl'] = 'api/messages/sendImageUrl';
$route['api/sendDocumentUrl'] = 'api/messages/sendDocumentUrl';
$route['api/sendVideoUrl'] = 'api/messages/sendVideoUrl';
$route['api/sendLocation'] = 'api/messages/sendLocation';
$route['api/sendVCard'] = 'api/messages/sendVCard';
$route['api/sendListMessage'] = 'api/messages/sendListMessage';
$route['api/sendButtonMessage'] = 'api/messages/sendButtonMessage';
$route['api/sendTemplateMessages'] = 'api/messages/sendTemplateMessages';

// Group Messaging
$route['api/sendMessageTextGroup'] = 'api/group/sendMessageText';
$route['api/sendImageUrlGroup'] = 'api/group/sendImageUrl';
$route['api/sendDocumentUrlGroup'] = 'api/group/sendDocumentUrl';
$route['api/sendVideoUrlGroup'] = 'api/group/sendVideoUrl';
$route['api/sendLocationGroup'] = 'api/group/sendLocation';
$route['api/sendVCardGroup'] = 'api/group/sendVCard';
$route['api/sendListMessageGroup'] = 'api/group/sendListMessage';
$route['api/sendButtonMessageGroup'] = 'api/group/sendButtonMessage';
$route['api/sendTemplateMessagesGroup'] = 'api/group/sendTemplateMessages';

// End group Messaging

// chats 
$route['api/listMessages'] = 'api/chats/listMessages';
$route['api/listChats'] = 'api/chats/listChats';
//end chats

// Group Event

$route['api/createGroup'] = 'api/group/createGroup';
$route['api/makeAdminGroup'] = 'api/group/makeAdminGroup';
$route['api/demoteAdminGroup'] = 'api/group/demoteAdminGroup';
$route['api/addParticipants'] = 'api/group/addParticipants';
$route['api/removeParticipants'] = 'api/group/removeParticipants';
$route['api/updateSubjectGroup'] = 'api/group/updateSubjectGroup';
$route['api/updateDescriptionGroup'] = 'api/group/updateDescriptionGroup';
$route['api/leaveGroup'] = 'api/group/leaveGroup';
$route['api/inviteCode'] = 'api/group/inviteCode';
$route['api/listParticipants'] = 'api/group/listParticipants';
$route['api/groupInfo'] = 'api/group/groupInfo';
$route['api/listGroup'] = 'api/group/listGroup';

// CronJob
$route['api/createJob'] = 'api/broadcast/createJob';
$route['api/runningJob'] = 'api/broadcast/runningJob';
//

$route['payment/paypal'] = 'client/paypal';
$route['payment/paypal/buyProduct/(:any)'] ='client/paypal/buyProduct/$1';
$route['payment/success'] = 'client/paypal/paymentSuccess';
$route['payment/fail'] = 'client/paypal/paymentFail';
$route['payment/ipn'] = 'client/paypal/ipn';

// End Group Event

// io service
$route['io'] = 'io/service';
$route['midtrans'] = 'io/midtrans';
// end io service

// instance
$route['api/device/(:any)'] = 'api/devices/getQR/$1';
$route['api/updateMultidevice'] = 'api/devices/updateMultidevice';
$route['api/deviceStatus'] = 'api/devices/getStatus';
$route['api/deviceLogout'] = 'api/devices/logoutInstance';

// end instance

// tools 
$route['api/checkNumber'] = 'api/tools/checkNumber';
$route['api/getImages'] = 'api/tools/getImages';

// end tools

// guest 
$route['guest_bulks'] = 'guest/bulk';
$route['guest_bulk/add'] = 'guest/bulk/add';
$route['guest_bulk/detail/(:any)'] = 'guest/bulk/detail/$1';
$route['guest_bulk/delete/(:any)'] = 'guest/bulk/delete/$1';

$route['api/guest_bulk/list'] = 'guestapi/bulk/list';



$route['guest_devices'] = 'guest/device';
$route['guest_device/add'] = 'guest/device/add';
$route['guest_device/add'] = 'guest/device/add';
$route['guest_device/authqr/(:any)'] = 'guest/device/authQr/$1';
$route['guest_device/logout/(:any)'] = 'guest/device/logoutInstance/$1';

$route['api/guest_device/save'] = 'guestapi/devices/add';
$route['api/guest_device/list'] = 'guestapi/devices/list';
$route['api/guest_device/detail/(:any)'] = 'guestapi/devices/getQR/$1';

$route['guest_contact'] = 'guest/contact';
$route['guest_contact/add'] = 'guest/contact/add';
$route['guest_contact/import'] = 'guest/contact/import';
$route['guest_contact/edit/(:any)/(:any)'] = 'guest/contact/edit/$1/$2';
$route['guest_contact/delete/(:any)/(:any)'] = 'guest/contact/delete/$1/$2';

$route['api/guest_contact/save'] = 'guestapi/contact/save';

$route['guest_list'] = 'guest/group';
$route['guest_list/add'] = 'guest/group/add';
$route['guest_list/delete/(:any)'] = 'guest/group/delete/$1';

$route['api/guest_list/save'] = 'guestapi/lists/save';
$route['api/guest_list/list'] = 'guestapi/lists/list';

$route['guest_dashboard'] = 'guest/dashboard';

// end guest


$route['default_controller'] = 'welcome';
$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;
