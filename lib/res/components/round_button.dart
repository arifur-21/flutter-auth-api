
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;


  const RoundButton({Key? key,
    this.buttonColor = Colors.greenAccent,
    this.textColor = Colors.indigo,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(50)
        ),
        child: loading? Center(child: CircularProgressIndicator()):
        Center(
          child: Text(title),
        ),
      ),
    );
  }
}
