import 'package:mybloclogin/helpers/toast.dart';
/*

class SignupModel {
  String? email;
  String? isError;

  SignupModel(this.isSignup,this.isError);
  SignupModel.fromJson(Map<String, dynamic> json) {
    isSignup = json['isSignup'];
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSignup'] = this.isSignup;
    data['isError'] = this.isError;
    return data;
  }
}*/

class SignupModel {
  String? email;
  SignupModel(String? result){
    email = result;
    //ToastPrinter("Assigned in image = "+ email.toString());
  }}