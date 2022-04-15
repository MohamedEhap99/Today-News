import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static SharedPreferences?preferences;

 static init()async{
    preferences= await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
  required String key,
     required bool value,
})async{
    return await preferences!.setBool(key, value);
   }

 static bool? getBoolean({
   required String key,
 }){
   return  preferences!.getBool(key);
 }

}