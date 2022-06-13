String ip = "192.168.1.108";

String urlLogin = "http://$ip:5001/api/common/login";
String urlVerifyCode= "http://$ip:5001/api/client/verifyCode";
String urlProfile= "192.168.1.104/api/client/profile";
String urlSignup = "http://$ip:5001/api/client/signup";
String urlForgetPasswordSendVerificationAccount ="http://$ip:5001/api/common/forgetPasswordSendVerificationAccount";
String urlForgetPasswordValidateAccount ="http://$ip:5001/api/common/forgetPasswordValidateAccount";
String urlForgetPasswordChangePasswordAccount ="http://$ip:5001/api/common/forgetPasswordChangePasswordAccount";
String urlResendVerificationCode ="http://$ip:5001/api/client/resendVerfication";

String urlUpdateProfile = "http://$ip:5001/api/client";
String urlUpdatePicProfile = "http://$ip:5001/api/client/updateimage";
String urlResetPassword = "http://$ip:5001/api/client/resetPassword";

////home
String urlCategories = "http://$ip:5002/api/admin/category";
String urlEventsHome = "http://$ip:5002/api/admin/event?size=5&category=";


////search

////event
String urlCheckCode ="http://$ip:5003/api/admin/codepromo/check";
String urlPurchase  = "http://$ip:5003/api/payment/purchase";
String urlSaveEvent = "http://$ip:5003/api/payment/saveEvent";
String urlUnSaveEvent = "http://$ip:5003/api/payment/unsaveEvent";
String urlSavedEvent = "http://$ip:5003/api/payment/";


//notification
String urlNotificationUser = "http://$ip:5001/api/client/notification?";
String urlNotificationAll = "http://$ip:5001/api/client/notificationAll?";


//tikcets
String urlTickets = "http://$ip:5003/api/payment/";