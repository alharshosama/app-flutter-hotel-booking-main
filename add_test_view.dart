
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repositories/test_repository.dart';
import '../widget_drawer/custom_appbar.dart';

class TextAddView extends StatefulWidget {
  //const TextAddView({Key? key}) : super(key: key);

  @override
  State<TextAddView> createState() => _TestAddViewState();

}

class _TestAddViewState extends State<TextAddView> {
  bool loading = false;
  bool isError = false;
  bool  isSuccess= false;
  String error =" ";
  String success =" ";
  var namelCtr = TextEditingController();
  var detailsCtr =TextEditingController();
  var formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: CustomDrawer(context),
     appBar: CustomAppbar("Add Test"),
      body: Center(
        child: Form(
            key: formkey,

            child:
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: namelCtr,
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
             loading ?CircularProgressIndicator() : TextButton(onPressed: ()async{
                    if(formkey.currentState!.validate()){
                      try{
                        setState(() {
                          loading =true;
                        });
                        var data = {
                          "Name":namelCtr.text,
                          "Details":detailsCtr.text
                        };
                        var addRes = await TestRepository().add(data);
                        if(addRes>0 ){
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


                  }, child: Text("Send")),

                  isError? Text("Error$error",style: TextStyle(color: Colors.red),):SizedBox(),
                  isSuccess? Text("Added Successfully",style: TextStyle(color: Colors.green),):SizedBox()
                ],
              ),

            )),

      ),


    );
  }
}
