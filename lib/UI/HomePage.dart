// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_typing_uninitialized_variables, duplicate_ignore
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/UI/add_task_bar.dart';
import 'package:taskmanager/UI/widgets/button.dart';
import 'package:taskmanager/services/theme_services.dart';
import 'package:get/get.dart';
import '../services/notification_services.dart';
import 'theme.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  DateTime _selectedDate= DateTime.now() ;

  get isDarkMode => null;

  @override
  void initState() {
    // to : implement init State
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.grey.shade800 : Colors.white,
      appBar: _appbar(),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Row(
            children: [
              Container(
                margin: // shows date
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: subHeadingStyle,
                    ), // for date
                    Text(
                      "Today",
                      style: TextStyle(
                        fontSize: 20,
                        color: Get.isDarkMode
                            ? Colors.grey.shade50
                            : Colors.grey.shade800,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // button /button / button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MyButton(
                 label: "+add task ",
                 
                 onTap: ()=>Get.to(AddTaskPage()),
              )
              ),
            ],
          ),
          Column(
            // date picker
            children: [
              _addDateBar(),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: DatePicker(
                  DateTime.now(),
                  height: 100,
                  width: 75,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Get.isDarkMode
                      ? Colors.blue.shade300
                      : Colors.blue.shade500,
                  selectedTextColor: Colors.black,
                  dateTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode
                        ? Colors.grey.shade50
                        : Colors.grey.shade800,
                  ),
                  dayTextStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode
                        ? Colors.grey.shade50
                        : Colors.grey.shade800,
                  )),
                  monthTextStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode
                        ? Colors.grey.shade50
                        : Colors.grey.shade800,
                  )
                  ),
                  onDateChange:(date){
                    _selectedDate = date;
                  
                  },

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _addDateBar(){
    return Container();
  }
  
  _appbar() {
    return AppBar(
      elevation: 3,
      toolbarHeight: 55,
      backgroundColor: context.theme.backgroundColor,
      // ignore: duplicate_ignore, duplicate_ignore
      leading: GestureDetector(
        onTap: () {
          // ignore: avoid_print
          print('tapped');
          ThemeService().switchtheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "activated light theme"
                  : "Activated Dark Theme");
          notifyHelper.scheduledNotification();
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
