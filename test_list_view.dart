

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/test_model.dart';
import '../repositories/test_repository.dart';
import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';
import 'add_test_view.dart';
import 'delete_list_view.dart';

class TestListView extends StatefulWidget {
 // const TestListView({Key? key}) : super(key: key);

  @override
  State<TestListView> createState() => _TestListViewState();
}

class _TestListViewState extends State<TestListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("TestList"),
      body: Container(
        child:FutureBuilder<List<TestModel>>(
          future:TestRepository().getAll(),
          builder:(context,snapchat){
            if(snapchat.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
          else if(snapchat.connectionState == ConnectionState.done){
              if(snapchat.hasError){
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }
             else if(snapchat.hasData){
    var list = snapchat.data ?? [];
    return RefreshIndicator(
      onRefresh: ()async{
        setState(() {

        });
      },

      child: ListView.separated(
      itemBuilder:(context,index){
      return ListTile(
      leading: Text("${list[index].id}"),
      title: Text("${list[index].name}"),
      subtitle: Text("${list[index].details}"),
      trailing: IconButton(
        onPressed: ()async{
          var delRes= await showDialog(context: context, builder: (context){
            return DeleteTestView(itemId: list[index].id??0,);
          });
          if(delRes !=null && delRes ==true){
            setState(() {

            });
          }
        },
        icon: Icon(Icons.delete),
      ),
      );

      },
      separatorBuilder: (context,index){
      return Divider();

      }, itemCount: list.length),
    );

    }

             else{
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }

              }

            else{
              return Center(child: Text("Erorr:${snapchat.error.toString()}"));

            }

          },  ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: ()async{
        var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TextAddView()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
      }),
    );
  }
}


