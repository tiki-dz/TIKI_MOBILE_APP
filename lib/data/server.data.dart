String ip = "192.168.28.61";

String urlLogin = "http://$ip:5001/api/common/login";
String urlVerifyCode= "http://$ip:5001/api/client/verifyCode";
String urlProfile= "192.168.1.104/api/client/profile";
String urlSignup = "http://$ip:5001/api/client/signup";
String urlForgetPasswordSendVerificationAccount ="http://$ip:5001/api/common/forgetPasswordSendVerificationAccount";
String urlForgetPasswordValidateAccount ="http://$ip:5001/api/common/forgetPasswordValidateAccount";
String urlForgetPasswordChangePasswordAccount ="http://$ip:5001/api/common/forgetPasswordChangePasswordAccount";
String urlUpdateProfile = "http://$ip:5001/api/client";
String urlUpdatePicProfile = "http://$ip:5001/api/client/updateimage";
String urlResetPassword = "http://$ip:5001/api/client/resetPassword";

////home
String urlCategories = "http://$ip:5002/api/admin/category";
String urlEvents = "http://$ip:5002/api/admin/event?category=";


////search

////
String urlCheckCode ="http://$ip:5003/api/admin/codepromo/check";
String urlPurchase  = "http://$ip:5003/api/payment/purchase";