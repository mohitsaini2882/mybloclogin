import 'package:flutter/material.dart';
import 'package:mybloclogin/bloc/signup_bloc.dart';
import 'package:mybloclogin/helpers/toast.dart';

class Validator{
  String? email,password,confirmPassword;
  SignUpBloc _subloc = new SignUpBloc();
  Validator({required this.email,required this.password,required this.confirmPassword}){
    if(email!.isEmpty){
    ToastPrinter("Empty email");
    }else if(password!.isEmpty){
    ToastPrinter("Empty password");
    }else if(confirmPassword!.isEmpty){
    ToastPrinter("password is Empty");
    }else if(email!.isNotEmpty && password!.isNotEmpty && confirmPassword!.isNotEmpty){
      //check and validate email
      if(email!.contains("@")){
        if(password!.length<6){
          ToastPrinter("Password is less than 6");
        }else {
          if(password==confirmPassword){
            _subloc.SignUpBlocfun(email!, password!);
          }else{
            ToastPrinter("password is not equal to confirm password");
          }
        }
      }else{
        ToastPrinter("Not a valid email Please check");
      }
    }
  }
 }