import 'package:flutter/material.dart';
import 'package:mybloclogin/helpers/loginvalidator.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                 SizedBox(
                   height: MediaQuery.of(context).size.height/5,
                 ),
                 Text("Login",style: TextStyle(
                     color: Colors.blue,
                     fontWeight: FontWeight.bold,
                     fontSize: 18),),
                 SizedBox(
                   height: 12.5,
                 ),
                 Padding(
                   padding: const EdgeInsets.fromLTRB(25,12.5,25,12.5),
                   child: TextField(
                     controller: _emailController,
                     decoration: InputDecoration(
                       hintText: "Enter your email"
                     ),
                   ),
                 ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25,12.5,25,12.5),
                child: TextField(
                  controller: _passController,
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                  ),
                  obscureText: true,
                ),
              ),
              ElevatedButton(onPressed: (){
                LoginValidator newboj = LoginValidator(email: _emailController.text.toString(), pass: _passController.text.toString());
              }, child: Text("Login"))

            ],
          ),
        ),
      )
    );
  }
}
