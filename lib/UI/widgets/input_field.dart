import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taskmanager/UI/theme.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const MyInputField({Key? key,

    required this.title,

    required this.hint,

    this.controller,

    this.widget,

  
  }):super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
       children: [
        
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 280, 0),
            child: Text(
              title,
              textAlign: TextAlign.start,
              style:  TextStyle(
                color: Get.isDarkMode
                        ? Colors.grey.shade50
                        : Colors.grey.shade800, 
                fontSize: 15,
                fontWeight: FontWeight.bold
          
              ),
            ),
          ),
         const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            width: 330,
            padding: const EdgeInsets.symmetric(vertical:0,horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Get.isDarkMode
                        ? Colors.grey.shade50
                        : Colors.grey.shade800,
                width:1.5
      
              ),
              borderRadius: BorderRadius.circular(12),

            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget==null?false:true ,
                    autofocus: true,
                    autocorrect: true,
                    cursorColor:Get.isDarkMode
                        ? Colors.grey.shade50
                        : Colors.grey.shade800, 
                    controller: controller,
                    style: SubTitleStyle,
                    decoration: InputDecoration(
                      

                      hintText: hint,
                      hintStyle: SubTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.colorScheme.background,
                          width: 0,
                        ),
                      ),
                    ),
                  ),
                
                ),
                widget==null?Container():Container(child:widget ,)
              ],
            ),


          ),
        ],

      ),
    );
  }
}