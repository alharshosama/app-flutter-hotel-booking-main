

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GridPage(),
    );
  }
}



class GridPage extends StatefulWidget {
  const GridPage({Key? key}) : super(key: key);

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("GridPage"),
      body: GridView.count(
        crossAxisCount: 3, // Number of columns
        children: List.generate(9, (index) {
          return GestureDetector(
            onTap: () {
              final snackBar = SnackBar(
                content: Text('Clicked Item ${index + 1}'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              color: Colors.blue,
              margin: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Item ${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
