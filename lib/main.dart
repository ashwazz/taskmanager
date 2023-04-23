import 'package:flutter/material.dart';
import 'package:taskmanager/DB/db_helper.dart';
import 'package:taskmanager/UI/HomePage.dart';
import 'package:taskmanager/services/theme_services.dart';
import 'package:get_storage/get_storage.dart';
import 'UI/theme.dart';
import 'package:get/get.dart';
import 'package:taskmanager/UI/add_task_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  await GetStorage.init();

  runApp(MyApp());
}

// for null safety errors , by keeping a ? ahead of a variable u can tell compiler value might be null
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: Themes.light1,
      darkTheme: Themes.dark1,
      themeMode: ThemeService().theme,
      home:  HomePage(),
       routes: {
    '/addTask': (context) => AddTaskPage(),
    '/homepage': (context) => HomePage(),

  },
    );
  }
}
