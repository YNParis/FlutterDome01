import 'package:flutter/material.dart';


Widget CustomButton(BuildContext context, IconData icon, String title) {
  final color = Theme
      .of(context)
      .primaryColor;
  return new Column(
    children: <Widget>[
      Icon(icon, color: color,),
      Padding(padding: EdgeInsets.all(20.0),
        child: Text(title, style: TextStyle(color: color),),),
  ],
  );
}
