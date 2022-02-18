import 'package:mybloclogin/models/login_model.dart';
import 'package:mybloclogin/models/signup_model.dart';
import 'package:mybloclogin/resources/providers/login_provider.dart';
import 'package:mybloclogin/resources/providers/signup_provider.dart';

class Repository {
  //signup provider here
  final signupProvider = SignUpProvider();
  Future<SignupModel> repoSignupFun(String email,String pass) {
    return(signupProvider.SignUpProviderFun(email : email,password: pass));
  }
  //login provider here
  final loginProvider = LoginProvider();
  Future<LoginModel> repoLoginFun(String email,String pass) {
    return(loginProvider.LoginProviderFun(email: email, password: pass));
  }
}




