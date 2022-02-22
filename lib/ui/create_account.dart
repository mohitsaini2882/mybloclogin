import 'package:flutter/material.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/bloc/signup_bloc.dart';
import 'package:mybloclogin/helpers/validator.dart';
import 'package:mybloclogin/models/signup_model.dart';
import 'package:mybloclogin/ui/login_screen.dart';
import 'package:mybloclogin/ui/user_details.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}
class _CreateAccountState extends State<CreateAccount> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController = new TextEditingController();

  //create localstorage obj
  LocalStoreageHelper _localStoreageHelper =LocalStoreageHelper();
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();///fbfgb
  }
  //new project
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
      ),
      body: StreamBuilder(
            stream: subloc.createaccount,
            builder: (context,AsyncSnapshot<SignupModel>snapshot){
              if(snapshot.hasData){
                 return Container(
                     height: MediaQuery.of(context).size.height,
                     width: MediaQuery.of(context).size.width,
                     child: Center(
                       child: CircularProgressIndicator(),
                     )
                   );
              }else{
                 return Container(
                   height: MediaQuery.of(context).size.height,
                   width: MediaQuery.of(context).size.width,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.fromLTRB(12.5,4,12.5,4),
                         child: TextField(
                           controller: _emailController,
                           decoration: InputDecoration(
                               hintText: "Enter your email"
                           ),
                           keyboardType: TextInputType.emailAddress,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(12.5,4,12.5,0),
                         child: TextField(
                           controller: _passwordController,
                           decoration: InputDecoration(
                               hintText: "Enter your password"
                           ),
                           keyboardType: TextInputType.text,
                           obscureText: true,
                           maxLength: 6,
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.fromLTRB(12.5,0,12.5,4),
                         child: TextField(
                           controller: _confirmPasswordController,
                           decoration: InputDecoration(
                               hintText: "Enter confirm password"
                           ),
                           keyboardType: TextInputType.text,
                           obscureText: true,
                           maxLength: 6,
                         ),
                       ),
                       ElevatedButton(onPressed: ()async{
                         Validator _objValidator = await Validator(email : _emailController.text.toString(), password: _passwordController.text.toString(),
                             confirmPassword: _confirmPasswordController.text.toString());
                          Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(builder: (
                               context) => const UserDetails()),
                          );
                       }, child: Container(
                           alignment: Alignment.center,
                           width: MediaQuery.of(context).size.width/3,
                           child: Text("Create Account")
                       )),
                       const SizedBox(
                         height: 12,
                       ),
                       ElevatedButton(onPressed: ()async{
                           Navigator.pushReplacement(
                             context,
                             MaterialPageRoute(builder: (context) => const Login()),
                           );
                       }, child: Container(
                           alignment: Alignment.center,
                           width: MediaQuery.of(context).size.width/3,
                           child: Text("Login")
                        )
                       )
                      /*GestureDetector(
                            onTap: (){
                            ToastPrinter("Output Run ");
                            // ToastPrinter(_localStoreageHelper.getitemFromLocalStorage("isSignup:").toString());
                            ToastPrinter(snapshot.data!.email.toString());
                           // ToastPrinter("Show Output Run");
                            //ToastPrinter(dataContainer.FetchErrorOccure().toString());
                            //ToastPrinter(dataContainer.isErrorOccure.toString());
              },
                          child: Container(
                             alignment: Alignment.center,
                              height: 55,
                              width:250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue,
                              ),
                              child: Text("Show Output",style: TextStyle(color: Colors.white),)))*/
                     ],
                   ),
                 );
              }
            },
      )
    );
  }
}
