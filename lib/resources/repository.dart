import 'package:mybloclogin/models/signup_model.dart';
import 'package:mybloclogin/resources/providers/signup_provider.dart';

class Repository {
  final signupProvider = SignUpProvider();
  Future<SignupModel> repoSignupFun(String email,String pass) {
    return(signupProvider.SignUpProviderFun(email : email,password: pass));
  }
}




