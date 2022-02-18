import 'package:mybloclogin/bloc/login_bloc.dart';
import 'package:mybloclogin/helpers/toast.dart';

class LoginValidator{
  LoginBloc _loginBloc = new LoginBloc();
  String? email,pass;
  LoginValidator({required this.email,required this.pass}){
    if(email!.isNotEmpty && pass!.isNotEmpty){
       _loginBloc.LoginBlocfun(email!, pass!);
    }else{
      if(email!.isEmpty){
        PrintToast("Enter email your email");
      }else if(pass!.isEmpty){
        PrintToast("Enter your password");
      }
    }
  }
}