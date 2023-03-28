import 'package:flutter/material.dart';

class DoneTaskScreen extends StatelessWidget {
  const DoneTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            Text("Done Tasks Screen",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
            ),
Expanded(
  child:   Image(
      // Color( 0xff+color degree )
      image: AssetImage("images/WhatsApp Image 2023-01-26 at 1.00.02 PM.jpeg"),
             // color: Color(0xff23456),

             // height: double.infinity,
             //
             // width: double.infinity,



  ),
),

          ],
        ),

    );
  }
}
