import 'package:flutter/material.dart';

class FavorateButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FavorateButtonState();
  }

}

class _FavorateButtonState extends State<FavorateButton> {
  int num = 41;
  bool _isFavorated = false;

  void _switchState() {
    setState(() {
      _isFavorated = !_isFavorated;
      if (_isFavorated) {
        num++;
      } else {
        num--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(children: <Widget>[
      IconButton(
        icon: _isFavorated ? Icon(Icons.star) : Icon(Icons.star_border),
        color: Theme
            .of(context)
            .primaryColor,
        onPressed: () {
          _switchState();
        },
      ),
      Text(num.toString())
    ],);
  }


}