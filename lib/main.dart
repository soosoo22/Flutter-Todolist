import 'package:flutter/material.dart';
import 'package:untitled1/todo.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo list',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        unselectedWidgetColor: Colors.transparent,
      ),
      home: TodoListWidget(),
    );
  }
}

class TodoListWidget extends StatefulWidget {
  @override
  State createState() => TodoListWidgetState();
}

class TodoListWidgetState extends State<TodoListWidget> {
  var _setting = false;
  final list = []; //item
  final list2 = []; //item.controller

  @override
  void dispose() {
    super.dispose();
    //controller.dispose();
  }

  void addTodo(TodoItem item) {
    setState(() {
      list.add(item);
      list2.add(item.controller);
    });
  }

  void removeTodo(TodoItem item) {
    setState(() {
      list.remove(item);
      list2.remove(item.controller);
      //item.controller = '' as TextEditingController;
    });
  }

  void setChecked(TodoItem item, bool isChecked) {
    setState(() {
      item.isChecked = isChecked;
      print(item.isChecked);
    });
  }

  Widget buildListTime(BuildContext context, TodoItem item) {
    return Stack(
      children: [
        item.isChecked == true
            ? Positioned(
                top: 6,
                left: 16,
                child: Container(
                  width: 30,
                  child: Stack(
                    children: [
                      Positioned(
                          top: -8,
                          child: Image.asset(
                            'assets/icons/checkmark.png',
                            width: 28,
                          )),
                      Container(
                        width: 17.0,
                        height: 17.0,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                      ),
                    ],
                  ),
                ))
            : Positioned(
                top: 6,
                left: 16,
                child: Container(
                  width: 17.0,
                  height: 17.0,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                ),
              ),
        SizedBox(
          width: 25,
        ),
        Padding(
          padding: EdgeInsets.only(top: 15, left: 65),
          child: Container(
            width: 270,
            height: 20,
            child: TextField(
              controller: item.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '오늘의 할일',
                //counterText: '',
              ),
              style: item.isChecked == true
                  ? TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.black,
                      fontStyle: FontStyle.italic,
                    )
                  : null,
            ),
          ),
        ),
        Positioned(
            top: -10,
            left: -15,
            child: Checkbox(
              checkColor: Colors.transparent,
              activeColor: Colors.transparent,
              value: item.isChecked,
              onChanged: (value) {
                setChecked(item, !item.isChecked);
                setState(() {
                  // item.isChecked = value!;
                  // print(item.isChecked);
                });
              },
            )),
        Positioned(
          top: -10,
          right: 5,
          child: _setting == true
              ? IconButton(
                  onPressed: () {
                    removeTodo(item);
                  },
                  icon: Icon(Icons.delete),
                )
              : Text(''),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/paper-texture.jpg'),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 50.0,
                  ),
                  Container(
                    width: 1.0,
                    //height: double.minPositive,
                    color: Colors.red[200],
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Container(
                    width: 1.0,
                    //height: double.minPositive,
                    color: Colors.red[200],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 45),
                child: Stack(
                  children: [
                    //SizedBox(height: 35,),
                    Padding(
                      padding: EdgeInsets.only(top: 23),
                      child : Container(
                        //padding: EdgeInsets.only(top: 49),
                        //width: 450,
                        //height: 600,
                        //color: Colors.red,
                        //초록 테두리 삭제 밑에
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     //color: Colors.green,
                        //   ),
                        // ),

                        child: ListView(
                          //scrollDirection: Axis.vertical,
                          //세로로 길게 스크롤 생김 밑에
                          //physics: NeverScrollableScrollPhysics(),
                          children: list
                              .map((item) => buildListTime(context, item))
                              .toList(),
                        ),
                      ),
                    ),


                    // Positioned(
                    //   top: 10,
                    //   child: Row(
                    //     children: [
                    //       IconButton(
                    //         onPressed: () {
                    //           addTodo(TodoItem(name: ''));
                    //           //print(MediaQuery.of(context).size.height );
                    //           // controller.text = '';
                    //         },
                    //         icon: Icon(Icons.add),
                    //       ),
                    //       Container(),
                    //     ],
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 21.0,
                    //   right: 10.0,
                    //   child: InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           // _setting = true;
                    //           reverse();
                    //         });
                    //       },
                    //       child: Icon(Icons.remove)),
                    // ),
                  ],
                ),
              ),

              Stack(
                children: [
                  Container(
                      width: double.infinity,
                      //height:100.h,
                      height: MediaQuery.of(context).size.height * 0.11,
                      child: Image.asset(
                        'assets/darkbrown.jpg',
                        fit: BoxFit.fill,
                      )),
                  Positioned.fill(
                    //bottom: 1.0,
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                addTodo(TodoItem(name: ''));
                                //print(MediaQuery.of(context).size.height );
                                // controller.text = '';
                              },
                              icon: Icon(Icons.add),
                            ),
                            Text(
                              'TO DO LIST',
                              style: TextStyle(fontSize: 20.0),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  reverse();
                                });
                              },
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
              //   child: Divider(
              //     //height: MediaQuery.of(context).size.height * 0.253,
              //     thickness: 2.0,
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.16),
              //   child: Divider(
              //     //height: MediaQuery.of(context).size.height * 0.253,
              //     thickness: 2.0,
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.20),
              //   child: Divider(
              //     //height: MediaQuery.of(context).size.height * 0.253,
              //     thickness: 2.0,
              //   ),
              // ),

              // Divider(
              //   height: MediaQuery.of(context).size.height * 0.31,
              //   thickness: 2.0,
              // ),
              // Positioned.fill(
              //     top: -690,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -620,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -550,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -480,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -410,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -340,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -270,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -200,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -130,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: -60,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 10,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 80,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 150,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 220,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 290,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 360,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 430,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 500,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 570,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 640,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 710,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 780,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 850,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),
              // Positioned.fill(
              //     top: 920,
              //     child: Divider(
              //       thickness: 2.0,
              //     )),

              // Padding(
              //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
              //   child: Container(
              //     width: double.infinity,
              //     height: 1.0,
              //     color: Colors.green,
              //   ),
              // ),

              /*Padding(
                padding: EdgeInsets.only(top: 45),
                child: Stack(
                  children: [
                    //SizedBox(height: 35,),
                    Padding(
                      padding: EdgeInsets.only(top: 23),
                      child : Container(
                        //padding: EdgeInsets.only(top: 49),
                        //width: 450,
                        //height: 600,
                        //color: Colors.red,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),
                        child: ListView(
                          //scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          children: list
                              .map((item) => buildListTime(context, item))
                              .toList(),
                        ),
                      ),
                    ),


                    // Positioned(
                    //   top: 10,
                    //   child: Row(
                    //     children: [
                    //       IconButton(
                    //         onPressed: () {
                    //           addTodo(TodoItem(name: ''));
                    //           //print(MediaQuery.of(context).size.height );
                    //           // controller.text = '';
                    //         },
                    //         icon: Icon(Icons.add),
                    //       ),
                    //       Container(),
                    //     ],
                    //   ),
                    // ),
                    // Positioned(
                    //   top: 21.0,
                    //   right: 10.0,
                    //   child: InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           // _setting = true;
                    //           reverse();
                    //         });
                    //       },
                    //       child: Icon(Icons.remove)),
                    // ),
                  ],
                ),
              ),*/

            ],
          ),
        ),
      ),
    );
  }

  void reverse() {
    if (_setting == true) {
      _setting = false;
      print('setting is $_setting');
    } else {
      _setting = true;
      print('setting is $_setting');
    }
  }
}
// class Rept{
//   void rept(){
//     Positioned.fill(top: MediaQuery.of(context).size.height, child: Divider(thickness: 2.0,));
//   }
// }
