import 'package:cs4/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositories/Product_repositore.dart';
import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';

class UpdateProductView extends StatefulWidget {
   UpdateProductView({Key? key,required this.Product}) : super(key: key);
   // final int Id;
   final ProductModel? Product ;
  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  // var nameCtr = TextEditingController();
  // var levelCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();

  late TextEditingController nameCtr ;
  late TextEditingController priceCtr ;
  late TextEditingController detailsCtr ;


  var formKey = GlobalKey<FormState>() ;
  void initState() {
    super.initState();
    nameCtr = TextEditingController(text: widget.Product?.name);
    priceCtr = TextEditingController(text: widget.Product?.price.toString());
    detailsCtr = TextEditingController(text: widget.Product?.details);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Updat Product"),
      body: Form(

              key: formkey,

              child:
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: nameCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Name must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Name",
                            labelText: "Name",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            )

                        ),


                      ),
                      SizedBox(height: 20,),

                      TextFormField(
                        //    keyboardType: TextInputType.text,
                        controller: priceCtr,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<3){
                            return "Price must be more than 5 chars";

                          }
                          /* else if(!val.contains("@")){
                            return "name must inculde @ char";

                          }*/
                        },
                        decoration: InputDecoration(
                            hintText: "Price",
                            labelText: "Price",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            )

                        ),


                      ),


                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        //   obscureText: true,
                        controller: detailsCtr,
                        style: TextStyle(color: Colors.black87),
                        validator: (val){
                          if(val==null){
                            return "This is value is null";

                          }
                          if(val.length<5){
                            return "Details must be more than 5 chars";

                          }
                          /*  else if(!val.contains("&")){
                            return "Details must inculde & char";

                          }*/
                        },

                        decoration: InputDecoration(
                            hintText: "Details",
                            labelText: "Details",
                            counterText: "20",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent,
                                ),
                                borderRadius: BorderRadius.circular(20)
                            )

                        ),


                      ),

                      SizedBox(height: 20,),
                      loading ?CircularProgressIndicator() : TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black87, // foreground
                              backgroundColor: Colors.teal),
                          onPressed: ()async{

                        if(formkey.currentState!.validate()){
                          try{
                            setState(() {
                              loading =true;
                            });
                            var data = {
                              "Id":widget.Product?.id??0,
                              "Name":nameCtr.text,
                              "Price":priceCtr.text,
                              "Details":detailsCtr.text
                            };
                            var updaRes = await ProductRepository().update(data);
                            if(updaRes>0 ){
                              setState(() {
                                loading =false;
                                isSuccess =true;
                                isError =false;
                                error="";
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
                        }
                        else{
                          // error="Operation field!!!";
                        }


                      }, child:const Text("Update")),

                      isError? Text("Error$error",style: TextStyle(color: Colors.red),):SizedBox(),
                      isSuccess? Text("Added Successfully",style: TextStyle(color: Colors.green),):SizedBox()
                    ],
                  ),
                ),

              )),




    );
  }
}
