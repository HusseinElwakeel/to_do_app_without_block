import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/modules/archived_task/archived_task_screen.dart';
import 'package:todo_list/modules/done_task/done_task_screen.dart';
import 'package:todo_list/modules/new_task/new_task_screen.dart';
import 'package:todo_list/shared/components.dart';
import 'package:todo_list/shared/constants.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
late Database database;


class _HomeLayoutState extends State<HomeLayout> {
  var name;
  var titleController = TextEditingController();
  var timecontroller = TextEditingController();
  var formkey =GlobalKey<FormState>();
  late String ? value;
  var dateControoler =TextEditingController();

  int currentIndex = 0;
  List<Widget> Screens = [
    NewTaskScreen(),
    DoneTaskScreen(),
    ArchivedTaskScreen(),
  ];

  List<String> titles = [
    "New Task Screen",
    "Done Task Screen",
    "Archived Task Screen",
  ];

  bool isBottomSheetOpened = false;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  IconData fabicon = Icons.edit;
  @override
  void initState() {
    super.initState();
    createDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text(titles[currentIndex]),
      ),
      body: list.length==0?Center(child: CircularProgressIndicator()):Screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(isBottomSheetOpened){
            if(formkey.currentState!.validate()) {
              insertToDatabase(
                title:titleController.text,
                date:dateControoler.text,
                time:timecontroller.text ,
              ).then((value)
              {
                getDataFromDataBase(database).then((value)
                {

                  setState(() {
                    Navigator.pop(context);
                    isBottomSheetOpened=false;
                    fabicon = Icons.add;
                    list=value;
                    print(list);
                  });
                  // print(list[0]["title"]);
                  //  to get some thing from map list[0][title]
                }
                );


              }
              );

            }

          }else
            {
              scaffoldkey.currentState!.showBottomSheet(
                      (context) =>  Container(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                             defaultTextFormField(
                                 controller: titleController ,
                                 type: TextInputType.text,
                                 onTap: (){
                                   print("text tapped.........................................");
                                 },
                                 validator: (value)
                                 {
                                   if(value.isEmpty){
                                     // print("value must not be empty") ;
                                     return "Text must not be empty";
                                   }
                                   else {

                                     return null;
                                   }
                                 },
                                 label: "Text",
                                 prefix: Icons.title_sharp,
                             ),
                                SizedBox(height: 20,),

                                defaultTextFormField(
                                    controller: timecontroller,
                                    type: TextInputType.datetime,
                                    onTap: (){
                                      showTimePicker(
                                          context: context,
                                          initialTime:TimeOfDay.now(),
                                      ).then(
                                              (value)
                                      {
                                        timecontroller.text=value!.format(context);
                                        print(value!.format(context));
                                      }
                                      );
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "time must not be emppty";
                                      }
                                      return null;
                                    },
                                    label: "Time:",
                                    prefix: Icons.access_time_filled,
                                ),
                                SizedBox(height: 10,),


                              defaultTextFormField(
                              controller: dateControoler,
                              type: TextInputType.datetime,
                              validator: (value)

                              {
                                if(value.isEmpty){
                                  return "Date must not be empty";
                                }
                                else{
                                  return null;
                                }
                              },
                              label: "Date:",
                              prefix: Icons.date_range_outlined,
                                onTap: ()
                                {
                                  showDatePicker(

                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse("2023-05-03")).then((value)
                                      {
                                        print(DateFormat.yMMMd().format(value!),);
                                        dateControoler.text =DateFormat.yMMMd().format(value!);


                                      });
                                }
                          ),
                              ],
                            ),
                          ),
                        ),
                      ),

              //  ده عشان لو قفلتها بإيدى هتحصل مشكله فده بيحل المشكله
              ).closed.then(
                      (value)
                  {
                    // Navigator.pop(context);   انا الى بنزله بإيدى
                    isBottomSheetOpened=false;
                    setState(() {
                      fabicon = Icons.add;

                    });
                  });
              isBottomSheetOpened=true;
              setState(() {
                fabicon=Icons.edit;
              });

            }
          // فى حاله then مش هعمل async or  await
          // try{
          //   name = await getName();
          //   print(name);
          /////   throw("There are Error !!!!");   // عشان نعمل error
          // }
          // catch(error){
          //   print("error is : ${error.toString()}");
          // }
// try {
//   var h = await getN();
//   print(h);
// }
// catch(error){
//   print(error);
//           }
//           getN().then((value) {
//             print(value);
//             print("osama");
//             throw("انا عملت ايرور ");
// }).catchError((error)
//           {
//             print("error is${error.toString()}");
//           }
//           );

          // getName().then((value) {
          //   print(value);
          //   print("hussein");
          //   // throw ("there are  errors ");  // عشان اعمل error
          // }).catchError((error) {
          //   print("errors is : ${error.toString()}");
          // });
          // insertToDatabase();
        },
        child: Icon(
            fabicon
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.blue,
        elevation: 90,
        showSelectedLabels: true,
// بتظهر الى مختاره

        type: BottomNavigationBarType.fixed,
        currentIndex:currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;

          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.table_rows_sharp),
            label: "New Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done_all,
            ),
            label: "Done",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: "Archived",
          ),
        ],
      ),
    );
  }

  // version for sqflite is: sqflite: ^1.3.0 in pubspec.yaml
  //وبتظهر فى pubspec.lock انى عملتلها generate

  //عشان يكون عندى database لازم اعمل شويه حاجات

  //1.create database
  //2.create tables
  //3.open database to get from it an object to able to :
  //4.insert to database
  //5.get from database
  //6.update in database
  //7.delete from database

  //اى حاجه هعملها فىmethod

  Future<String> getName() async {
    return "Hussein Elwakeel";
  }

  void createDataBase() async {
    database = await openDatabase(
      "todo.db", version: 1, // "todo.db"   الى هو اسم الداتا بيز path //
      // table بيتغير لما اغير ال  version
      onCreate: (database, version) async {
        print("Database is created ");

        await database
            .execute(
            'CREATE TABLE Tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, Time Text , status Text)')
            .then((value) {
          print("table is created ");
        }).catchError((error) {
          ("there are error ${error.toString()}");
        });
      }, // هناخد object من الداتا بيز
// () الحاجه هنا الى بتدهالى

      onOpen: (database) {
        print("Database is opened ");
        getDataFromDataBase(database).then((value)
        {

          setState(() {
            list=value;
            print(list);
          });
          // print(list[0]["title"]);
        //  to get some thing from map list[0][title]
        }
        );
      //  next to get from database
      //  هنبعتلها الداتا بيز
      },
    );
  }
}

Future insertToDatabase({
 required String ?title,
  required String ?date,
  required String ?time,

}

    ) async {
  return await database.transaction((txn)
  {
    return txn.rawInsert("INSERT INTO Tasks(title,date,Time,status) VALUES('$title','$date','$time','New Task')",
    ).then(
            (value) {
          print("$value database is inserted");
        }).catchError(
            (error)
        {
          print("there are error in insert ${error.toString()}");
        });

  });




}

//........... To get Data from Database ...............//


// void getDataFromDatabase(databas)async{
//  List<Map> list =  await database.rawQuery("Select * FROM Tasks");
//  print(list);
// // // select *(=) all from task(table your create)
// }
Future <List<Map>> getDataFromDataBase(database)async{
   return await database.rawQuery("Select * From Tasks");


}

