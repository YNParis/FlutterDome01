import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() {
    return new _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {

  bool _switched = true;
  bool _checked = false;
  String _CheckBoxState = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('基础控件')),
        body: Container(
          alignment: Alignment.topCenter,

          child: Column(children: <Widget>[
            Switch(
                value: _switched,
                onChanged: (value) {
                  setState(() {
                    _switched = value;
                  });
                }),
            Checkbox(
              value: _checked,
              activeColor: Theme
                  .of(context)
                  .primaryColor,
              onChanged: (value) {
                setState(() {
                  _checked = value;
                  _CheckBoxState = value.toString();
                });
              },
              tristate: true,),
            Text(_CheckBoxState), //三种状态，true,false,null
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '这是提示文本',
                hintStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 20.0,
                ),

              ),
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
              ),
              maxLength: 100,
              maxLines: 3,
              cursorColor: Colors.black,
            ),
          ],
          ),)
    );
  }
}