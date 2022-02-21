import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/ui/login_screen.dart';
class ShowUserDetails extends StatefulWidget {
  const ShowUserDetails({Key? key}) : super(key: key);

  @override
  _ShowUserDetailsState createState() => _ShowUserDetailsState();
}

class _ShowUserDetailsState extends State<ShowUserDetails> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confimPasswordController = new TextEditingController();

  //create localstorage obj
  LocalStoreageHelper _localStoreageHelper =LocalStoreageHelper();
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confimPasswordController.dispose();
    super.dispose();///fbfgb
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Text("Edit user details",style: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),),
              /*Padding(
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
              padding: const EdgeInsets.fromLTRB(12.5,4,12.5,4),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                    hintText: "Enter your password"
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.5,4,12.5,4),
              child: TextField(
                controller: _confimPasswordController,
                decoration: InputDecoration(
                    hintText: "Enter your confirm password"
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),*/
            SizedBox(
              height: 25,
            ),
            ElevatedButton(onPressed: ()async{
              await _auth.sendPasswordResetEmail( email: _localStoreageHelper.getitemFromLocalStorage("emailId:").toString());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            }, child: Text("Reset Passoword")),
          ],
      ),

      )
    );
  }
}
