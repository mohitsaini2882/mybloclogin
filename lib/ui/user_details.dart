import 'package:flutter/material.dart';
import 'package:mybloclogin/helpers/firestore_helper.dart';
import 'package:mybloclogin/helpers/local_storage_helper.dart';
import 'package:mybloclogin/helpers/toast.dart';
import 'package:mybloclogin/models/signup_model.dart';
import 'package:mybloclogin/ui/login_screen.dart';
class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}
class _UserDetailsState extends State<UserDetails> {
  TextEditingController _fullNameController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _bioController = new TextEditingController();
  String? FullName,Age,Bio;
  String? UID;


  //create localstorage obj
  LocalStoreageHelper _localStoreageHelper =LocalStoreageHelper();
  //create firesore_helper obj
  FirestoreHelper _firestoreHelper = FirestoreHelper();
  @override
  void dispose(){
    _fullNameController.dispose();
    _ageController.dispose();
    _bioController.dispose();
    super.dispose();///fbfgb
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assignUID();
  }

  void assignUID()async{
    String? resultvlaue = _localStoreageHelper.getitemFromLocalStorage("uid:");
    if(resultvlaue!.isNotEmpty){
      UID = resultvlaue;
    }else{
      ToastPrinter("Exception Run : Don't have any uid");
    }
  }


  void storeData({required String? Fullname, required String? Age,required String? Bio })async{
    if(FullName!.isNotEmpty && Age!.isNotEmpty &&  Bio!.isNotEmpty ){
      Map<String?, String?> userDetails = {
        "FullName": FullName,
        "Age": Age,
        "Bio": Bio,
      };
      _firestoreHelper.addWithDoc(documentUID: UID, tag: "userDetails", yourData: userDetails);
    }
  }



  //new project
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Details"),
        ),
        body: StreamBuilder(
          //stream: subloc.UserDetails,
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
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
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
                        storeData(Fullname: FullName, Age: Age, Bio: Bio);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
                      }, child: const Text("Submit")),
                      const SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        )
    );
  }
}
