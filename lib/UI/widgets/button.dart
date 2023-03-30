
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onTap;
  const MyButton({Key?key,required this.label,required this.onTap}):super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child:Container(
        width: 100,
        height: 55, 
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.isDarkMode ?Colors.grey.shade400:Colors.grey.shade100,
        ),
        child: Center(
          child: Text(
            label,
            style:TextStyle(
              color: Colors.black,
              
            )
          ),
        )
      ),
    );
  }
}