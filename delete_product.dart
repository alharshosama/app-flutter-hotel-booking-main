import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositories/Product_repositore.dart';
import '../repositories/test_repository.dart';

class DeleteProduct extends StatefulWidget {
  DeleteProduct({Key? key, required this.itemid}) : super(key: key);
  final int itemid;
  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  String txt="Do want to delete this item?";
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:Icon(Icons.delete),
      content: Container(
        constraints: BoxConstraints(
          maxWidth: 300,
          minWidth: 150,
          maxHeight: 250,
          minHeight: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            loading ?CircularProgressIndicator() : Text("$txt"),

            isError? Text("Error$error",style: TextStyle(color: Colors.red),):SizedBox(),
            // isSuccess? Text("Added Successfully",style: TextStyle(color: Colors.green),):SizedBox(),
            Row(
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.black87, // foreground
                        backgroundColor: Colors.red),
                    onPressed: ()async{
                  try{
                    setState(() {
                      loading =true;
                    });

                    var addRes = await ProductRepository().delete(widget.itemid);
                    if(addRes>0 ){
                      setState(() {
                        loading =false;
                        isSuccess =true;
                        isError =false;
                        error="";
                        txt="Deleted Successfully";
                      });
                      Navigator.of(context).pop(true);
                    }
                    else{
                      setState(() {
                        loading =false;
                        isSuccess =false;
                        isError =true;
                        error="Operation field!!!";
                      });

                    }

                  }
                  catch(e) {
                    setState(() {
                      loading =false;
                      isSuccess =false;
                      isError =true;
                      error="Exp: ${e.toString()}";
                    });

                  }

                },
                    child: Text("Delete")),
                SizedBox(width: 40,),
                TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.black87, // foreground
                        backgroundColor: Colors.teal),
                    onPressed: (){
                  Navigator.of(context).pop(false);
                },
                    child: Text("Close")),

              ],
            ),
          ],

        ),
      ),
    );
  }
}
