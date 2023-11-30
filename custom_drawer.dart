
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../All lecture/Form_Page.dart';
import '../All lecture/grid.dart';
import '../All lecture/lec_4.dart';
import '../All lecture/lect_3.dart';
import '../View/test_list_view.dart';
import '../products/product_list_view.dart';



Widget CustomDrawer(BuildContext context){
  return Drawer(
    child: ListView(
      children:  [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: CircleAvatar(
          //  backgroundColor: Colors.white,
            backgroundImage: NetworkImage("https://su.edu.ye/ce/wp-content/uploads/sites/3/2016/01/niclas-illg-FJ5e_2f96h4-unsplash-scaled-450x267.jpg"),
          ),

        ),
        Row(
          children: [
            Text("My projects",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight:FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,),


        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return LecThree(title: '',);
                  })
              );
            },
            title: Text("Home page"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.home),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushNamed("/");
              /*Navigator.of(context).push(
                  MaterialPageRoute(builder: (context){
                    return labfoure();
                  })
              );*/
            },
            title: Text("First page"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.first_page),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return GridPage();
                  })
              );
            },
            title: Text("GridPage"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.grid_4x4_outlined),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return LecFour();
                  })
              );
            },
            title: Text("LecFour"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.lens_blur),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return FormPage();
                  })
              );
            },
            title: Text("FormPage"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.fax_rounded),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return TestListView();
                  })
              );
            },
            title: Text("TestListView"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.list),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          color: Colors.yellow,
          child: ListTile(
            onTap: (){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context){
                    return ProductListView();
                  })
              );
            },
            title: Text("ProductListView"),
            //leading: Icon(Icons.settings),
            //  subtitle: Text("This is lecThree "),
            trailing: Icon(Icons.production_quantity_limits),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(vertical: 5),
        //   color: Colors.yellow,
        //   child: ListTile(
        //     onTap: (){
        //       Navigator.of(context).pushReplacement(
        //           MaterialPageRoute(builder: (context){
        //             return ProductListView();
        //           })
        //       );
        //     },
        //     title: Text("ProductsListPage"),
        //     //leading: Icon(Icons.settings),
        //     //  subtitle: Text("This is lecThree "),
        //     trailing: Icon(Icons.production_quantity_limits),
        //   ),
        // ),


      ],
    ),
  );
}