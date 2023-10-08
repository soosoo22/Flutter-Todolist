// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:untitled/todo.dart';
//
// class ToDoList2 extends StatefulWidget {
//   const ToDoList2({Key? key}) : super(key: key);
//
//
//   @override
//   State<ToDoList2> createState() => _ToDoList2State();
// }
//
// DateTime today = DateTime.now();
// String todayFormat = DateFormat.yMMMd('en_US').format(today);
//
// class _ToDoList2State extends State<ToDoList2> {
//
//   var controller = TextEditingController();
//
//   var _isChecked = false;
//   List<Todo> todos = [];
//
//   _toggleTodo(Todo todo, bool isChecked){
//     setState((){
//       todo.isDone = isChecked;
//     });
//   }
//
//   _addTodo(controller){
//     setState(() {
//       todos.add(controller);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//           image: DecorationImage(
//             fit: BoxFit.cover,
//             image: AssetImage('assets/paper-texture.jpg'),
//           )),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           //mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               children: [
//                 SizedBox(width: 50.0,),
//                 Container(
//                   width: 1.0,
//                   //height: double.minPositive,
//                   color: Colors.red[200],
//                 ),
//                 SizedBox(width: 2.0,),
//                 Container(
//                   width: 1.0,
//                   //height: double.minPositive,
//                   color: Colors.red[200],
//                 ),
//               ],
//             ),
//             Stack(
//               children: [
//                 Container(
//                     width: double.infinity,
//                     height:100.0,
//                     child: Image.asset('assets/darkbrown.jpg',
//                       fit: BoxFit.fill,
//                     )),
//                 Positioned(
//                   bottom: 10.0,
//                   left: 10.0,
//                   child: InkWell(
//                     child: Icon(Icons.add),
//                     onTap: (){
//
//                     },
//                   ),
//                 ),
//                 Positioned.fill(
//                   bottom: 10.0,
//                   child: Align(alignment: Alignment.bottomCenter,child: Text('TO DO LIST',style: TextStyle(fontSize: 20.0),)),
//                 ),
//                 Positioned(
//                   bottom: 10.0,
//                   right: 10.0,
//                   child: Icon(Icons.settings),
//                 ),
//               ],
//             ),
//             Positioned.fill(top: -620, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -550, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -480, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -410, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -340, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -270, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -200, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -130, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: -60, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 10, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 80, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 150, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 220, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 290, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 380, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 450, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 520, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 590, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 680, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 750, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 820, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 890, child: Divider(thickness: 2.0,)),
//             Positioned.fill(top: 960, child: Divider(thickness: 2.0,)),
//
//             Positioned(
//               top: 120,
//               left: 15,
//               child: Container(
//                 width: 20.0,
//                 height: 20.0,
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                 ),
//                 child: Image(
//                   // ignore: null_check_always_fails
//                   image: _isChecked ? AssetImage('assets/icons/checkmark.png') : AssetImage('assets/paper-texture.jpg'),
//                 ),
//               ),
//             ),
//             Padding(
//               //top: 100,
//               padding: EdgeInsets.only(top: 105, left: 65,right: 30),
//               child: TextField(
//                 controller: controller,
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: '오늘의 할일',
//                 ),
//               ),
//             ),
//             Positioned(top:106, left:1, child: Checkbox(
//               checkColor: Colors.transparent,
//               activeColor : Colors.transparent,
//               value: _isChecked,
//               onChanged: (value){
//                 setState(() {
//                   _isChecked = value!;
//                   print(_isChecked);
//                 });
//               },
//             )),
//
//             Positioned(
//               top: 155,
//               left: 15,
//               child: Container(
//                 width: 20.0,
//                 height: 20.0,
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                 ),
//                 child: Image(
//                   image: AssetImage('assets/icons/checkmark.png'),
//                 ),
//               ),
//             ),
//             Padding(
//               //top: 100,
//               padding: EdgeInsets.only(top: 140, left: 65,right: 30),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: '오늘의 할일',
//                 ),
//               ),
//             ),
//
//             Positioned(
//               top: 190,
//               left: 15,
//               child: Container(
//                 width: 20.0,
//                 height: 20.0,
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                 ),
//                 child: Image(
//                   image: AssetImage('assets/icons/checkmark.png'),
//                 ),
//               ),
//             ),
//             Padding(
//               //top: 100,
//               padding: EdgeInsets.only(top: 175, left: 65,right: 30),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: '오늘의 할일',
//                 ),
//               ),
//             ),
//
//             Positioned(
//               top: 225,
//               left: 15,
//               child: Container(
//                 width: 20.0,
//                 height: 20.0,
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                 ),
//                 child: Image(
//                   image: AssetImage('assets/icons/checkmark.png'),
//                 ),
//               ),
//             ),
//             Padding(
//               //top: 100,
//               padding: EdgeInsets.only(top: 210, left: 65,right: 30),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: InputBorder.none,
//                   hintText: '오늘의 할일',
//                 ),
//               ),
//             ),
//
//             // Container(
//             //   child: SizedBox(
//             //     width: 280.0,
//             //     height: 600.0,
//             //     child: ListView.builder(
//             //       itemCount: todos.length,
//             //       itemBuilder: (BuildContext context, int index) {
//             //         return Dismissible(
//             //             key: Key(todos[index]),
//             //             child: Card(
//             //               shape: RoundedRectangleBorder(
//             //                   borderRadius: BorderRadius.circular(10.0)),
//             //               child: Container(
//             //                 height: 116.0,
//             //                 // decoration: BoxDecoration(
//             //                 //   color: Colors.white,
//             //                 //   borderRadius: BorderRadius.all(
//             //                 //     Radius.circular(10.0),
//             //                 //   ),
//             //                 // ),  //Text(todos[index]
//             //                 child: Padding(
//             //                   padding: EdgeInsets.all(10.0),
//             //                   child: Column(
//             //                     crossAxisAlignment:
//             //                         CrossAxisAlignment.start,
//             //                     children: [
//             //                       Text(
//             //                         'hello',
//             //                         style: TextStyle(fontSize: 12.0),
//             //                       ),
//             //                       Divider(
//             //                         thickness: 1.0,
//             //                       ),
//             //                       //SizedBox(height: 10.0,),
//             //                       Row(
//             //                         mainAxisAlignment:
//             //                             MainAxisAlignment.spaceBetween,
//             //                         children: [
//             //                           Text(
//             //                             'hi',
//             //                             style:
//             //                                 TextStyle(color: Colors.black),
//             //                           ),
//             //                           Checkbox(
//             //                               shape: CircleBorder(),
//             //                               activeColor: Colors.deepPurple,
//             //                               value: _isChecked,
//             //                               onChanged: (value) {
//             //                                 setState(() {
//             //                                   _isChecked = value!;
//             //                                 });
//             //                               })
//             //                         ],
//             //                       ),
//             //                       //SizedBox(height: 8.0,),
//             //                       Row(
//             //                         children: [
//             //                           Icon(
//             //                             Icons.access_time,
//             //                             size: 15.0,
//             //                             color: Colors.grey,
//             //                           ),
//             //                           SizedBox(
//             //                             width: 5.0,
//             //                           ),
//             //                           Text(
//             //                             '안녕하세요 반갑습니다.',
//             //                             style: TextStyle(
//             //                               fontSize: 12.0,
//             //                             ),
//             //                           ),
//             //                           Expanded(child: SizedBox()),
//             //                           InkWell(
//             //                               onTap: () {
//             //                                 Navigator.push(
//             //                                     context,
//             //                                     MaterialPageRoute(
//             //                                       builder: (context) =>
//             //                                           ListDetail(),
//             //                                     ));
//             //                               },
//             //                               child: Icon(
//             //                                 Icons.playlist_add_outlined,
//             //                                 color: Colors.grey,
//             //                                 size: 18.0,
//             //                               )),
//             //                           InkWell(
//             //                               onTap: () {
//             //                                 setState(() {
//             //                                   todos.removeAt(index);
//             //                                 });
//             //                               },
//             //                               child: Icon(
//             //                                 Icons.delete,
//             //                                 color: Colors.grey,
//             //                                 size: 18.0,
//             //                               )),
//             //                         ],
//             //                       ),
//             //                     ],
//             //                   ),
//             //                 ),
//             //               ),
//             //             ));
//             //       },
//             //     ),
//             //   ),
//             // ),
//             // Container(
//             //   child: SizedBox(
//             //     width: 280.0,
//             //     height: 500.0,
//             //     child: ListView(
//             //       children: [
//             //         Container(
//             //           height: 116.0,
//             //           decoration: BoxDecoration(
//             //             color: Colors.white,
//             //             borderRadius: BorderRadius.all(
//             //               Radius.circular(10.0),
//             //             ),
//             //           ),
//             //           child: Padding(
//             //             padding: EdgeInsets.all(10.0),
//             //             child: Column(
//             //               crossAxisAlignment: CrossAxisAlignment.start,
//             //               children: [
//             //                 Text(
//             //                   'hello',
//             //                   style: TextStyle(fontSize: 12.0),
//             //                 ),
//             //                 Divider(
//             //                   thickness: 1.0,
//             //                 ),
//             //                 //SizedBox(height: 10.0,),
//             //                 Row(
//             //                   mainAxisAlignment:
//             //                       MainAxisAlignment.spaceBetween,
//             //                   children: [
//             //                     Text(
//             //                       'hi',
//             //                       style: TextStyle(color: Colors.black),
//             //                     ),
//             //                     Checkbox(
//             //                         shape: CircleBorder(),
//             //                         activeColor: Colors.deepPurple,
//             //                         value: _isChecked,
//             //                         onChanged: (value) {
//             //                           setState(() {
//             //                             _isChecked = value!;
//             //                             //print(_isChecked);
//             //                           });
//             //                         })
//             //                   ],
//             //                 ),
//             //                 //SizedBox(height: 8.0,),
//             //                 Row(
//             //                   children: [
//             //                     Icon(
//             //                       Icons.access_time,
//             //                       size: 15.0,
//             //                       color: Colors.grey,
//             //                     ),
//             //                     SizedBox(
//             //                       width: 5.0,
//             //                     ),
//             //                     Text(
//             //                       '안녕하세요 반갑습니다.',
//             //                       style: TextStyle(
//             //                         fontSize: 12.0,
//             //                       ),
//             //                     ),
//             //                     Expanded(child: SizedBox()),
//             //                     InkWell(
//             //                         onTap: () {
//             //                           //Navigator.push(context, MaterialPageRoute(builder: (context) => ListDetail(),));
//             //                         },
//             //                         child: Icon(
//             //                           Icons.playlist_add_outlined,
//             //                           color: Colors.grey,
//             //                           size: 18.0,
//             //                         )),
//             //                   ],
//             //                 ),
//             //               ],
//             //             ),
//             //           ),
//             //         ),
//             //       ],
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
