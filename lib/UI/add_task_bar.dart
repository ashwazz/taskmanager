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
  const AddTaskPage({Key? Key}): super(key: Key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final DateTime _selectedDate =DateTime.now();
  int flag = 0; // to check if theme has changed 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar1(context),
      body:Column(
    
        children: [
         const SizedBox(
             height: 30,
              width: 20,
          ),
          Row(
            children: [
              const SizedBox(
             height: 0,
              width: 8,),
              Container(
                height: 45,
                width: 150,
                child:
                MyButton(
                 label: " ADD TASK ",
                 
                 
                 onTap: (){
                  
                // we changed from push named to pop , and passed flag 
                  Navigator.pop(context, 
                  Get.isDarkMode?1:0);
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
             MyInputField(title: "Title", hint:" enter your title"),
             MyInputField(title: "Note", hint:" enter your Note"),
             MyInputField(title: "Date", hint:DateFormat.yMd().format(_selectedDate),
             widget: IconButton(
              icon: Icon(Icons.calendar_month_outlined,
              color:Get.isDarkMode
                        ? Colors.grey.shade50
                        : Colors.grey.shade800,  ),
              onPressed: (){
                //print("hi there");
                _getDateFromUser();


              },
             ),
             ),
        ]
        
      )
    );
  }

  
   PreferredSizeWidget? _appbar1(BuildContext context) {
    

    return AppBar(
      elevation: 3,
      toolbarHeight: 55,
      backgroundColor: Get.isDarkMode ? Colors.grey.shade600:Color.fromARGB(255, 253, 248, 233),
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
            Get.isDarkMode? Icons.light_mode : Icons.nights_stay_sharp,
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

       const  SizedBox(
          width: 20,
        ),
      ],
    );
  }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../services/theme_services.dart';
// import 'package:taskmanager/UI/widgets/button.dart';
// import 'package:taskmanager/UI/theme.dart';
// import 'package:taskmanager/UI/widgets/input_field.dart';

// class AddTaskPage extends StatefulWidget {
//   // ignore: non_constant_identifier_names
//   const AddTaskPage({Key? Key}): super(key: Key);

//   @override
//   State<AddTaskPage> createState() => _AddTaskPageState();
// }

// class _AddTaskPageState extends State<AddTaskPage> {
//   final DateTime _selectedDate =DateTime.now();
    
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appbar1(context),
//       body: GetBuilder<ThemeService>(
//         init: Get.Put(ThemeService()),
//         builder: (themeService) => Column(
//           children: [
//             const SizedBox(
//               height: 30,
//               width: 20,
//             ),
//             Row(
//               children: [
//                 const SizedBox(
//                   height: 0,
//                   width: 8,
//                 ),
//                 Container(
//                   height: 45,
//                   width: 150,
//                   child: const Text(
//                     "ADD TASK",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             MyInputField(title: "Title", hint:" enter your title"),
//             MyInputField(title: "Note", hint:" enter your Note"),
//             MyInputField(
//               title: "Date",
//               hint: DateFormat.yMd().format(_selectedDate),
//               widget: IconButton(
//                 icon: Icon(
//                   Icons.calendar_month_outlined,
//                   color: themeService.isDarkMode
//                     ? Colors.grey.shade50
//                     : Colors.grey.shade800,
//                 ),
//                 onPressed: () {
//                   _getDateFromUser();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   _appbar1(BuildContext context) {
//     return AppBar(
//       elevation: 3,
//       toolbarHeight: 55,
//       backgroundColor: Get.find<ThemeService>().isDarkMode
//         ? Colors.grey.shade600
//         : Color.fromARGB(255, 253, 248, 233),
//       leading: GestureDetector(
//         onTap: () {
//           ThemeService().switchTheme();
//         },
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
//           child: Icon(
//             Get.find<ThemeService>().isDarkMode
//               ? Icons.light_mode
//               : Icons.nights_stay_sharp,
//             size: 30,
//           ),
//         ),
//       ),
//       actions: const [
//         ClipRRect(
//           child: CircleAvatar(
//             radius: 25,
//             backgroundColor: Colors.white,
//             backgroundImage: AssetImage("images/icons8-cat-profile-100.png"),
//           ),
//         ),
//         SizedBox(width: 20),
//       ],
//     );
//   }

  _getDateFromUser()async {
    DateTime? _PickerDate = await showDatePicker(context: context,
     
     initialDate: DateTime.now(),
     firstDate: DateTime(2015), 
     lastDate: DateTime(2100));
  }
}
