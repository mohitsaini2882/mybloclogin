class DataContainer{
  String? isSignUpUser= "sjflsdjk";
  String? isErrorOccure="sljflsjf";
  AssignData(String? a, String? b){
    isSignUpUser = a;
    isErrorOccure = b;
  }
  String? FetchIsSignupsUser(){
    return (isSignUpUser);
  }
  String? FetchErrorOccure(){
    return (isErrorOccure);
  }
}