import 'package:localstorage/localstorage.dart';

class LocalStoreageHelper{
  final LocalStorage _objS = new LocalStorage('localstorage_app');
  void addItemsToLocalStorage(String tag , String value) {
    _objS.setItem(tag, value);
  }
  String getitemFromLocalStorage(String tag) {
    final rvalue = _objS.getItem(tag);
    return (rvalue);
  }
  void deleteitemFormLocalStorage(String tag){
    _objS.deleteItem(tag);
  }
}