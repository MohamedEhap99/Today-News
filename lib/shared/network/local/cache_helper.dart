import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
 static SharedPreferences?Preferences;

 static init()async{
    Preferences= await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
  required String key,
     required bool value,
})async{
    return await Preferences!.setBool(key, value);
   }

 static bool? getBoolean({
   required String key,
 }){
   return  Preferences!.getBool(key);
 }

}