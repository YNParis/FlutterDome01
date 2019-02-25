import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {

  @override
  LoginPageState createState() {
    return new LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String _info = '';
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //设置controller的默认值，需要在build方法中进行，在class中会报错
    _accountController.text = "mrl";
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(
        children: <Widget>[
          Form(
              key: _formKey, //设置globalKey，用于后面获取FormState
              autovalidate: true, //开启自动校验，必须有上面的key属性，才可以定义这个属性
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: '用户名',
                        icon: Icon(Icons.person), //里面的图标
                        hintText: '邮箱/手机号/用户名'
                    ),
                    controller: _accountController,
                    validator: (v) {
                      return v
                          .trim()
                          .length > 0 ? null : "用户名不能为空";
                    },
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                      labelText: '密码',
                      icon: Icon(Icons.lock), //外面的图标
                      hintText: '6-12位密码',

                    ),
                    obscureText: true,
                    validator: (v) {
                      return v
                          .trim()
                          .length > 5 && v
                          .trim()
                          .length < 17 ? null : "密码长度需在6-16位之间";
                    },

                  ),
                  Text(_info),

                  Padding(padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        child: Text('登录'),
                        onPressed: () {
                          if ((_formKey.currentState as FormState).validate()) {
                            setState(() {
                              _info =
                              "用户名：${_accountController
                                  .text }，密码${ _passController
                                  .text}";
                            });
                          }
                        },
                      ))

                ],
              ))
        ],
      ),
    );
  }
}

