


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  var emailCtr = TextEditingController();
   var passwordCtr =TextEditingController();
   var formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("Form Page"),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailCtr,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(color: Colors.black87),
                    validator: (val){
                      if(val==null){
                        return "This is value is null";

                      }
                      if(val.length<5){
                        return "email must be more than 5 chars";

                      }
                      if(!val.contains("@")){
                        return "email must inculde @ char";

                      }
                    },
                    decoration: InputDecoration(
                        hintText: "example@gmail.com",
                        labelText: "Email",
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
                    //  keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: passwordCtr,
                    style: TextStyle(color: Colors.black87),
                    validator: (val){
                      if(val==null){
                        return "This is value is null";

                      }
                      if(val.length<5){
                        return "password must be more than 5 chars";

                      }
                      if(!val.contains("&")){
                        return "password must inculde & char";

                      }
                    },
                    decoration: InputDecoration(
                        hintText: "password",
                        labelText: "Password",
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
                  TextButton(onPressed: (){
                    if(formkey.currentState!.validate()){
                      print("======Email:${emailCtr.text}");
                      print("======password:${passwordCtr.text}");
                    }
                    else{
                      print("------------from not invalid-------");

                    }


                  }, child: Text("Send")),



                ],
              ),

            )),

      ),


    );
  }
}

