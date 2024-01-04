


import 'package:shared_preferences/shared_preferences.dart';

class CacheStore{
  final SharedPreferences sharedPreferences;

  CacheStore(this.sharedPreferences);


  bool getFirst(){
    return sharedPreferences.getBool("first") ?? true;
  }

  setFirst(bool first) async{
    await sharedPreferences.setBool("first", first);
  }

  bool getLogin(){
    return sharedPreferences.getBool("login") ?? false;
  }

  setLogin(bool login) async{
    await sharedPreferences.setBool("login", login);
  }


  String? getEmail(){
    return sharedPreferences.getString("email");
  }

  setEmail(String email) async{
    await sharedPreferences.setString("email", email);
  }





}