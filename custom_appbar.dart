

// import 'package:flutter/material.dart';
//
// Widget CustomAppbar(String title){
//  return AppBar(
//     title: Text(title),
//     centerTitle: true,
//   );
// }

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppbar(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigoAccent,
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}