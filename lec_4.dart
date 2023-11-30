

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';
import 'Form_Page.dart';
import 'lect_3.dart';

class LecFour extends StatefulWidget {
  const LecFour({Key? key}) : super(key: key);


  @override
  State<LecFour> createState() => _LecFourState();
}

class _LecFourState extends State<LecFour> {
  int _currentIndex = 0;
 var list=[
  Center(
    child: Container(
      child: Text("Home"),
    ),
  ),
  // Center(
 //   child: Container(
  //     child: Text("Second"),
  //   ),
 // ),
  FormPage(),
   // Center(
  //   child: Container(
  //     child: Text("Lec3"),
  //   ),
  // ),
 LecThree(title: 'LecThree',),
//
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("LecFour"),
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.green,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        onTap: (index){
          //print("=============$index=====================");
          _currentIndex=index;
          setState((){

          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            tooltip: "This is the home Icon",
            activeIcon: Icon(Icons.access_alarm),
            backgroundColor: Colors.deepOrange,
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Lec3',
          ),

        ],),
    );
  }
}

