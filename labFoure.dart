


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';

class labfoure extends StatefulWidget {
  const labfoure({Key? key}) : super(key: key);

  @override
  State<labfoure> createState() => _labfoureState();
}

class _labfoureState extends State<labfoure> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar:CustomAppbar("First page"),
      body: Column(
        children: [
          // CarouselSlider(
          //   options: CarouselOptions(height: 200.0,
          //     autoPlay: true,
          //     autoPlayInterval: Duration(milliseconds: 5000),
          //     reverse: true,
          //     scrollDirection: Axis.horizontal,
          //     onPageChanged: (index,reason){
          //       print("${reason.name}");
          //       if(reason.name=="maunal"){
          //         ScaffoldMessenger.of(context).showSnackBar(
          //             SnackBar(content: Text("slider number:${index}"),duration: Duration(milliseconds: 3000),));
          //       }
          //     },
          //   ),
          //   items: [1,2,3,4,5].map((i) {
          //     return Builder(
          //       builder: (BuildContext context) {
          //         return Container(
          //             width: MediaQuery.of(context).size.width,
          //             margin: EdgeInsets.symmetric(horizontal: 5.0),
          //             decoration: BoxDecoration(
          //                 color: Colors.amber
          //             ),
          //             child: Text('text $i', style: TextStyle(fontSize: 16.0),)
          //         );
          //       },
          //     );
          //   }).toList(),
          // ),
          //const SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(top: 10),
            color: Colors.deepOrange,
            height: 300,
            width: MediaQuery.of(context).size.width * 0.9,
          ),
        ],
      ),
      drawer: CustomDrawer(context),


    );
  }
}
