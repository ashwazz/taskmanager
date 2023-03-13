import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const MaterialColor kLightGrey = MaterialColor( 0xFF686565,
<int,Color>{
  50:Color( 0xFF686565),
  100:Color( 0xFF363333), 
  150:Color( 0xFF1E1C1C),
  200:Color( 0xFF050505),
  300: Color( 0xFF030303),
  400: Color( 0xFF020202),
  500: Color( 0xFF010101),
  600: Color( 0xFF000000),
  700: Color( 0xFF000000),
  800: Color( 0xFF000000),
  900: Color( 0xFF000000),
}
);
const MaterialColor kLightBlue = MaterialColor ( 0xFF8BCEE9,
<int,Color>{
    50: Color(0xFFE5F2F8),
    100: Color(0xFFBFDDEE),
    200: Color(0xFF94C4E3),
    300: Color(0xFF68ABD8),
    400: Color(0xFF4F9ED4),
    500: Color(0xFF3791D0),
    600: Color(0xFF2D84C8),
    700: Color(0xFF2477C0),
    800: Color(0xFF1A6AB8),
    900: Color(0xFF0F5DAF),
}
 );
class Themes{
   
    static final light1 =  ThemeData(
      backgroundColor: Colors.white70,
      primarySwatch: kLightBlue,
      brightness: Brightness.light
      );
   
     static final dark1 = ThemeData(
       primarySwatch: kLightGrey,
       brightness: Brightness.dark
      );
      
}
TextStyle get subHeadingStyle{

        return GoogleFonts.lato(
          textStyle:  TextStyle(
            
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode?Colors.grey.shade200:Colors.black54,
          )
        );
      }
TextStyle get HeadingStyle{

        return GoogleFonts.lato(
          textStyle:  TextStyle(
            
            fontSize: 25,
            fontWeight: FontWeight.bold,
            
          )
        );
      }