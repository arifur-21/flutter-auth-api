
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralException extends StatefulWidget {

  final VoidCallback onPress;

  const GeneralException({Key? key, required this.onPress}) : super(key: key);

  @override
  State<GeneralException> createState() => _GeneralExceptionState();
}

class _GeneralExceptionState extends State<GeneralException> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: height * .15,),
          Icon(Icons.cloud_off, color: Colors.red, size: 50,),
          Center(child: Text("We're unable to process your request. \n please try again")),

          SizedBox(height: height * .15,),

          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Center(child: Text("Retry", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),)),
            ),
          )
        ],
      ),
    );

  }
}
