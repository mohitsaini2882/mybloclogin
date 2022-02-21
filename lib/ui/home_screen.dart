import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mybloclogin/helpers/firestore_helper.dart';
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
  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _bioController = new TextEditingController();

  //create localstorage obj
  LocalStoreageHelper _localStoreageHelper =LocalStoreageHelper();
  //create firesore_helper obj
  FirestoreHelper _firestoreHelper = FirestoreHelper();

  LocalStoreageHelper localStoreageHelper = LocalStoreageHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
   String? userDetails = "";
   String? emailId = "";
   String? uId = "";
   //global variables
  String? FullName,Age,Bio;
  String? UID;
   @override
  void initState() {
    // TODO: implement initState
    AssignData();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fullNameController.dispose();
    _ageController.dispose();
    _bioController.dispose();
  }

   void AssignData(){
     userDetails =  localStoreageHelper.getitemFromLocalStorage("currentUser:");
     emailId = localStoreageHelper.getitemFromLocalStorage("emailId:");
     uId = localStoreageHelper.getitemFromLocalStorage("uid:");
     UID = localStoreageHelper.getitemFromLocalStorage("uid:");
     UID = "6rONT0B2TUX4zAty2sSb4mcX7953";
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              PrintToast("UID : "+UID.toString());
            }, child: Text("Button"))
          ],
        ),
      )
        
      /*StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(UID).collection("userdetails").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
             return Center(
              child: CircularProgressIndicator(),
            );
          }return ListView(
          children: snapshot.data!.docs.map((document) {
             return Container(
          child: Center(child: Text("FullName : "+ document['FullName'])),
           );
           }).toList(),
          );
          },
      ),*/
    );
  }
}
/*
Container(
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
height: 8,
),
Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Padding(
padding: const EdgeInsets.fromLTRB(12.5,4,12.5,4),
child: TextField(
controller: _fullNameController,
decoration: InputDecoration(
hintText: "Enter your full name"
),
keyboardType: TextInputType.emailAddress,
),
),
Padding(
padding: const EdgeInsets.fromLTRB(12.5,4,12.5,0),
child: TextField(
controller: _ageController,
decoration: InputDecoration(
hintText: "Enter your age"
),
keyboardType: TextInputType.number,
obscureText: false,
maxLength: 3,
),
),
Padding(
padding: const EdgeInsets.fromLTRB(12.5,0,12.5,4),
child: TextField(
controller: _bioController,
decoration: InputDecoration(
hintText: "Bio"
),
keyboardType: TextInputType.text,
obscureText: false,
maxLength: 40,
),
),
ElevatedButton(onPressed: ()async{
_localStoreageHelper.addItemsToLocalStorage("fullName:",_fullNameController.text.toString());
_localStoreageHelper.addItemsToLocalStorage("age:",_ageController.text.toString());
_localStoreageHelper.addItemsToLocalStorage("bio:",_bioController.text.toString());

FullName = _localStoreageHelper.getitemFromLocalStorage("fullName:");
Age =  _localStoreageHelper.getitemFromLocalStorage("age:");
Bio = _localStoreageHelper.getitemFromLocalStorage("bio:");
//user map here//
Map<String?, String?> yourData = {
  "FullName": FullName,
  "Age": Age,
  "Bio": Bio,
};
UID = "6rONT0B2TUX4zAty2sSb4mcX7953";
_firestoreHelper.updateData(UID: UID, yourData: yourData);

}, child: const Text("Edit Details")),
const SizedBox(
height: 55,
),
],
),

],
),
*/
/*
),*/
