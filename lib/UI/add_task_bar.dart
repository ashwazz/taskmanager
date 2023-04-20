import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../services/theme_services.dart';
import 'package:taskmanager/UI/widgets/button.dart';
import 'package:taskmanager/UI/theme.dart';
import 'package:taskmanager/UI/widgets/input_field.dart';
import 'package:get_storage/get_storage.dart';

class AddTaskPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  const AddTaskPage({Key? Key}) : super(key: Key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime _selectedDate = DateTime.now();
  String _starttime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endtime = "9:30 pm";
  int _selectedremind = 5;
  List<int> remindList =[
    5,
    10,
    15,
    20,
  ];
  String _selectedRepeat= "None";
  List<String> repeatList =[
   "None",
   "Daily",
   "Weekly",
   "Monthly",
  ];
  int flag = 0; // to check if theme has changed
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar1(context),
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 30,
              width: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  height: 0,
                  width: 8,
                ),
                Container(
                    height: 45,
                    width: 150,
                    child: MyButton(
                      label: " ADD TASK ",
                      onTap: () {
                        // we changed from push named to pop , and passed flag
                        Navigator.pop(context, Get.isDarkMode ? 1 : 0);
                      },
                    )
                    // const Text("ADD TASK",
                    // textAlign: TextAlign.center, // aligns the text
                    //  style: TextStyle(

                    //   fontSize: 25,
                    //   fontWeight: FontWeight.bold,
                    //   fontStyle: FontStyle.italic

                    //  ),
                    // ),

                    ),
              ],
            ),
            MyInputField(title: "Title", hint: " enter your title"),
            MyInputField(title: "Note", hint: " enter your Note"),
            MyInputField(
              title: "Date",
              hint: DateFormat.yMd().format(_selectedDate),
              widget: IconButton(
                icon: Icon(
                  Icons.calendar_month_outlined,
                  color: Get.isDarkMode
                      ? Colors.grey.shade50
                      : Colors.grey.shade800,
                ),
                onPressed: () {
                  //print("hi there");
                  _getDateFromUser();
                },
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 160, minWidth: 50),
                  child: MyInputField(
                    title:
                        "Start Time", // Set the text to display from left to right

                    hint: _starttime,
                    widget: IconButton(
                      onPressed: () {
                        // on pressed for time set widget
                        _getTimeFromUser(isStartTime: true);
                      },
                      icon: Icon(
                        Icons.access_time_rounded,
                        color: Get.isDarkMode
                            ? Colors.grey.shade50
                            : Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  constraints: BoxConstraints(maxWidth: 160, minWidth: 50),
                  child: MyInputField(
                    title: "End Time",
                    hint: _endtime,
                    widget: IconButton(
                      onPressed: () {
                        // on pressed for time set widget
                        _getTimeFromUser(isStartTime: false);
                      },
                      icon: Icon(
                        Icons.access_time_rounded,
                        color: Get.isDarkMode
                            ? Colors.grey.shade50
                            : Colors.grey.shade800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
             MyInputField(title: " Remind ", hint: " $_selectedremind minutes early", //remind
             widget:DropdownButton(
              icon:Icon(Icons.arrow_drop_down  ,
                color: Get.isDarkMode
                            ? Colors.grey.shade50
                            : Colors.grey.shade800,),
                iconSize: 32,
                elevation: 3,
                underline: Container(height: 0,),
                style: SubTitleStyle,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedremind = int.parse(newValue!);
                  });
                  },
                items: remindList.map<DropdownMenuItem<String>>((int value){
                    return DropdownMenuItem<String>(
                       value: value.toString(),
                            child:Text(
                             
                              value.toString(),
                            ),
                    );
                }
                ).toList(),
             ),
             ) , 
              MyInputField(title: " Repeat ", hint: " $_selectedRepeat ", //repeat
             widget:DropdownButton(
              icon:Icon(Icons.arrow_drop_down  ,
                color: Get.isDarkMode
                            ? Colors.grey.shade50
                            : Colors.grey.shade800,),
                iconSize: 32,
                elevation: 3,
                underline: Container(height: 0,),
                style: SubTitleStyle,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedRepeat = newValue!;
                  }
                  );
                  },
                items: repeatList.map<DropdownMenuItem<String>>((String? value){
                    return DropdownMenuItem<String>(
                          value: value,
                            child:Text(
                              
                              value!,
                              style: TextStyle(
                               color: Get.isDarkMode
                            ? Colors.grey.shade50
                            : Colors.grey.shade800,
                              ),
                            ),
                    );
                }
                ).toList(),
             ),
             ) , 
            const SizedBox(height: 120),
          ]),
        ));
  }

  PreferredSizeWidget? _appbar1(BuildContext context) {
    return AppBar(
      elevation: 3,
      toolbarHeight: 55,
      backgroundColor: Get.isDarkMode
          ? Colors.grey.shade600
          : Color.fromARGB(255, 253, 248, 233),
      // ignore: duplicate_ignore
      leading: GestureDetector(
        onTap: () {
          // ignore: avoid_print
          print('tapped');
          // setState(() {});
          ThemeService().switchtheme();
          // if(flag == 0){
          //   flag = 1 ;  // theme changed to dark
          // }
          // else{
          //   flag = 0 ;  // theme changed to white
          // }
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
        const ClipRRect(
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("images/icons8-cat-profile-100.png"),
          ),
        ),

        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  _getDateFromUser() async {
    DateTime? _PickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2100));
    if (_PickerDate != null) {
      setState(() {
        _selectedDate = _PickerDate;
      });
    } else {
      print("entered date is null");
    }
  }

  _getTimeFromUser({required bool isStartTime})async {
     var _pickedtime = await _showTImePicker();
    String _formattedTime = _pickedtime.format(context);
    if (_pickedtime == null) {
      print("picked time is null");
    } else if (isStartTime == true) {
      setState(() {
        _starttime = _formattedTime;
      });
    } else if (isStartTime == false) {
     setState(() {
        _endtime = _formattedTime;
     });
    }
  }

  _showTImePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_starttime.split(":")[0]),
          minute: int.parse(_starttime.split(":")[1].split(" ")[0]),
        ));
  }
}
