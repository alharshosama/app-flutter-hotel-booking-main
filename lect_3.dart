

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';

class LecThree extends StatefulWidget {
  final String title;
  const LecThree({Key? key,required this.title}) : super(key: key);

  @override
  State<LecThree> createState() => _LecThreeState();
}

class _LecThreeState extends State<LecThree> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    Color clr = Colors.deepOrange;
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Home page"),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        // color: Colors.orange,
        // height: 300,
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.grey,
              thickness: 2.5,
            );

          },
          itemCount: 10,
          itemBuilder: (context,index){
            return  GestureDetector(
              onTap: () {
                if(clr==Colors.deepOrange) {
                  clr = Colors.yellow;
                }
                else{
                  clr = Colors.deepOrange;
                }
                setState((){

                });
              },
              child: Container(
                // constraints: BoxConstraints(
                //   maxHeight:150 ,
                //   maxWidth: 300,
                // ),
                //   margin: EdgeInsets.all(10),
                  color: clr,
                  //  color: index%2==0?Colors.yellow:Colors.deepOrange,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Item  ${index+1}"),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 37,
                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person,size: 50,),
                          ),
                        )

                      ],
                    ),
                  )),
            );
          },

        ),
      ),
    );
  }
}


