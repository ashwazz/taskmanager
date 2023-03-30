import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/theme_services.dart';
import 'package:taskmanager/UI/widgets/button.dart';


class AddTaskPage extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const AddTaskPage({Key? Key}): super(key: Key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar1(context),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Container(
            height: 100,
            width: 75,
            child: MyButton(
                 label: "+add task ",
                 
                 onTap: (){
                  Navigator.pushNamed(context, '/homepage');
                 },
           ),
          )
        ],
      )
    );
  }
    _appbar1(BuildContext context) {
    
    return AppBar(
      elevation: 3,
      toolbarHeight: 55,
      backgroundColor: context.theme.colorScheme.background,
      // ignore: duplicate_ignore
      leading: GestureDetector(
        onTap: () {
          // ignore: avoid_print
          print('tapped');
          ThemeService().switchtheme();
          
        },
        // ignore: prefer_const_constructors
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          child: Icon(
            Get.isDarkMode ? Icons.light_mode : Icons.nights_stay_sharp,
            size: 30,
          ),
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        // isDarkMode?
        ClipRRect(
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("images/icons8-cat-profile-100.png"),
          ),
        ),

        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
