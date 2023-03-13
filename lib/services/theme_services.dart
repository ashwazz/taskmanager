import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService{
    final _box = GetStorage();
    final _key = 'isDarkMode';
    _saveThemeToBox(bool isDarkMode)=>_box.write(_key, isDarkMode);
    bool _loadthemefrombox()=>_box.read(_key)??false; // if there is no value *( which there isnt) , sets bool to false 
    ThemeMode get theme =>_loadthemefrombox()?ThemeMode.dark:ThemeMode.light; // ? is a tenery operator , if _loadthemefrombox is true , it runs the thememode.dark , or if false, it will run thememode.light
    void switchtheme(){
      Get.changeThemeMode(_loadthemefrombox()?ThemeMode.light:ThemeMode.dark);//changes the theme when called based on bool
      _saveThemeToBox(!_loadthemefrombox()); // sets the bool to opposite using !not gate , so that when its called again , in the above line it will perform the opposite function
    }  


}
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:get/get.dart';

// class ThemeService{
//     final _box = GetStorage();
//     final _key = 'isDarkMode';

//     ThemeService() {
//         GetStorage.init();
//     }

//     bool _loadthemefrombox() => _box.read(_key) ?? false;

//     ThemeMode get theme => _loadthemefrombox() ? ThemeMode.dark : ThemeMode.light;

//     void switchtheme() {
//       Get.changeThemeMode(theme == ThemeMode.light ? ThemeMode.light : ThemeMode.dark);
//     }
// }