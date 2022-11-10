import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class FollowButton extends StatelessWidget {
  final Function()? function;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final Color textColor;
  const FollowButton({Key? key,
  required this.text,
  required this.backgroundColor,
  required this.borderColor,
  required this.textColor,
  this.function
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
      onPressed: function,
      child: Container(
        width: 250,
        height: 27,
        
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5)
        ),
        alignment: Alignment.center,
        child: Text(text,
           style: TextStyle(color: textColor,fontWeight: FontWeight.bold),

        ),
      )),
    );
    
  }
}