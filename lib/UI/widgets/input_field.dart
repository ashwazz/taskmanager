import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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

          Text(
            title,
            style: HeadingStyle,
          ),
        ],

      ),
    );
  }
}