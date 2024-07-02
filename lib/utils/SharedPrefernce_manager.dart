



import 'package:shared_preferences/shared_preferences.dart';

class SharedPerfencesManager {
  SharedPreferences? _preference ;

  SharedPerfencesManager._privateConttructor();

  static final SharedPerfencesManager _instance = SharedPerfencesManager._privateConttructor();

  factory SharedPerfencesManager(){
    return _instance;
  }

  Future<void> init() async {
    _preference = await SharedPreferences.getInstance();
  }

  Future<void> saveString (String key , String value)async {
    await _preference!.setString(key , value);
  }

  String? getString(String key){
    return _preference?.getString(key);
  }

}


