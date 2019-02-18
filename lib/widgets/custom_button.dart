import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String label;

  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new RaisedButton(
      onPressed: () {
      },
      child: new Text(label),
    );
  }

}