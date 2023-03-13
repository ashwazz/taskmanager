import 'package:flutter/material.dart';
import 'package:taskmanager/UI/HomePage.dart';
import 'package:taskmanager/services/theme_services.dart';
import 'package:get_storage/get_storage.dart';
import 'UI/theme.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
     debugShowCheckedModeBanner: false,
      theme:Themes.light1,
      darkTheme: Themes.dark1,
      themeMode: ThemeService().theme,
      
      
      home: HomePage(),
    );
  }
}

