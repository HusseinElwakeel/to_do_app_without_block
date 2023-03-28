

import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color backGroundColor = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  required void Function() onTap,
  required String text,
}) => Container(
    width: width,
    decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(radius)),
    child: MaterialButton(
      onPressed: onTap,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ));

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required dynamic validator,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isClickable =true,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixClicked,
}) => TextFormField(
  controller: controller,
  keyboardType: type,
  enabled: isClickable,
  validator: validator,
  onFieldSubmitted: (s) {
    onSubmit!(s);
  },
  onTap: () {
    onTap!();
  },
  obscureText: isPassword,
  onChanged: (value) {
    print(value);
  },
  decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefix),
      suffixIcon: suffix != null
          ? IconButton(
        onPressed: () {
          suffixClicked!();
        },
        icon: Icon(suffix),
      )
          : null,
      border: OutlineInputBorder()),
);








Widget defaultTextButton({
  required void Function() onTap,
  required String text
})=> TextButton(
    onPressed: (){onTap();},
    child: Text(text.toUpperCase())
);
Widget buildTaskItem(Map model)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40,
        child: Text(
            "${model['Time']}"
        ),
      ),
      SizedBox(width: 20,),
      Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(
                  child: Text("${model['title']}",
                    textAlign: TextAlign.center,

                    style: TextStyle(

                      fontWeight:FontWeight.bold,
                      fontSize: 20,


                    ),

                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("${model['date']}"),
            ],
          ),
        ),
      ),
    ],
  ),
);




