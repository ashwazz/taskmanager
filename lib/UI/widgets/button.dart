import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function onTap;
  const MyButton({Key?key,required this.label,required this.onTap}):super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>onTap,
      child:Container(
        width: 120,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber.shade50,
        ),
        child: Text(
          label,
          style:TextStyle(
            color: Colors.white,
          )
        )
      ),
    );
  }
}