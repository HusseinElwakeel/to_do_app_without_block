import 'package:flutter/material.dart';
import 'package:todo_list/layout/home_layout.dart';
import 'package:todo_list/shared/components.dart';
import 'package:todo_list/shared/constants.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {



  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder:(context,index)=> buildTaskItem(list[index]),
        separatorBuilder:(context,builder) => SizedBox(height: 10,),
        itemCount:list.length,
    );



    }






  }





