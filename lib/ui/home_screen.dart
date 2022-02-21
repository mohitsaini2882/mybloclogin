import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/helpers/toast.dart';
import 'package:mybloclogin/main.dart';
import 'package:mybloclogin/ui/show_and_edit_userDetails.dart';
import 'package:mybloclogin/ui/splash_screen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LocalStoreageHelper localStoreageHelper = LocalStoreageHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
   String? userDetails = "";
   String? emailId = "";
   String? uId = "";
   @override
  void initState() {
    // TODO: implement initState
    AssignData();
  }

   void AssignData(){
     userDetails =  localStoreageHelper.getitemFromLocalStorage("currentUser:");
     emailId = localStoreageHelper.getitemFromLocalStorage("emailId:");
     uId = localStoreageHelper.getitemFromLocalStorage("uid:");
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: ()async{
                  await _auth.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SplashScreen()));
                }, child: Text("Logout")),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Text("All Details : "+userDetails.toString()),
            SizedBox(
              height: 12,
            ),
            Text("EmailId: "+ emailId.toString()),
            Text("UserId: "+ uId.toString()),
            SizedBox(
              height: 4,
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> const ShowUserDetails()));
            }, child: Text("Edit User Details"))

          ],
        ),
      ),
    );
  }
}
