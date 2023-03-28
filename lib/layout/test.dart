// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:todo_list/modules/archived_task/archived_task_screen.dart';
// import 'package:todo_list/modules/done_task/done_task_screen.dart';
// import 'package:todo_list/modules/new_task/new_task_screen.dart';
//
// class TestLayout extends StatefulWidget {
//   const TestLayout({Key? key}) : super(key: key);
//
//   @override
//   State<TestLayout> createState() => _TestLayoutState();
// }
//
// class _TestLayoutState extends State<TestLayout> {
//
//
//   late int currentIndex = 0;
//   List <Widget> Screens = [
//     NewTaskScreen(),
//     DoneTaskScreen(),
//     ArchivedTaskScreen(),
//
//   ];
//
//   List<String>titles = [
//     "New Task Screen",
//     "Done Task Screen",
//     "Archived Task Screen",
//
//   ];
//  late Database database;
//  var scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     createDatabase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key:scaffoldKey,
//       appBar: AppBar(
//         title: Text(titles[currentIndex]),
//       ),
//       body: Screens [currentIndex],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async
//         {
//           // try {
//           //    var name = await getName();
//           //   print(name);
//           //   throw("There are Error !!!!");
//           // }
//           // catch (error) {
//           //   print("error is : ${error.toString()}");
//           // }
//           //
//           // getName().then((value) {
//           //   print(value);
//           //   print("hussein");
//           //   throw("there are two errors ");
//           // }
//           // ).catchError((error) {
//           //   print("errors is :: ${error.toString()}");
//           // });
//           // scaffoldKey.currentState!.showBottomSheet((context) async {
//           //   Container(
//           // width: double.infinity,
//           // height: 120,
//           // color: Colors.pink,
//           //   );
//           // } as WidgetBuilder,
//           //
//           // );
//           insertToDatabase();
//         },
//         child: Icon(Icons.add),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         // backgroundColor: Colors.blue,
//         elevation: 90,
//         showSelectedLabels: true,
// // بتظهر الى مختاره
//
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//
//
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.table_rows_sharp),
//             label: "New Tasks",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.done_all,
//             ),
//             label: "Done",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.archive_outlined),
//             label: "Archived",
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//   Future<String> getName() async
//   {
//     return "Hussein Elwakeel";
//   }
//
//   void createDatabase()async
//   {
//     Database  database = await openDatabase(
//       "test.db",
//       version:1,
//         onCreate: (database ,version)async
//         {
//
//         print("database is created");
//
//         await database.execute(
//           "CREATE TABLE task (id INTEGER PRIMARY KEY, Title TEXT ,Date TEXT,Time TEXT,Status TEXT)"
//         ).then((value)
//         {
//           print("table created");
//
//         }
//         ).catchError((error){
//           print("there are erorr : ${error.toString()}");
//
//         });
//
//     },
//     onOpen: (database){
//       print("database is opened");
//
//     },
//
//
//
//     );
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   // }
//
// // open package sqflite
// //1.create database  2.create tables 3.open database 4.get from database 5.insert to database 6.dlete from db 7.update in db
//
// //make methods
//
// // void createDataBase ()async{
// //    database = await openDatabase(
// //       "todo.db",
// //       version: 1,
// //       onCreate: (database,version) async {
// //         print("database is created");
// //
// //         // When creating the db, create the table
// //         await database.execute(
// //             'CREATE TABLE do (id INTEGER PRIMARY KEY, name TEXT, value TEXT, num TEXT)');
// //         print("table is created");
// //
// //       },
// //       onOpen: (database){
// //         print("database is opened");
// //   },
// //
// //       );
// //
// //
// //
// //
// // }
// }
//
//
// // void insertToDatabase()async
// // {
// //     await database.transaction((txn) {
// //         txn.rawInsert(
// //           "INSERT INTO test(Title,Date,Time,Status) VALUES('go to gym','20jan2020','20:20','done')").then((value) {
// //             print("$value inserted successfuly");
// //         }).catchError((error){
// //       print("there are error in snserted ${error.toString()}");
// //     }
// //     // return null;
// //             },
// //
// //     ),
// //
// //
// //
// //     );
// //
// // }
//
//   void insertToDatabase() async{
//     await database.transaction((txn)  {
//       return txn.rawInsert(
//           "INSERT INTO test(Title,Date,Time,Status) VALUES('go to gym','20jan2020','20:20','done')").then((value) {
//         print(value);
//
//       }).catchError((error){
//         print("there are error in inserting ${error.toString()}");
//         // return null;
//       });
//     }
//     );
//
//   }
//
//
// }