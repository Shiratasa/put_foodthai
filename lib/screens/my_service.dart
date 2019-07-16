import 'package:flutter/material.dart';
import 'package:put_foodthai/models/user_model.dart';

class MyService extends StatefulWidget 
{
  final UserModel userModel;
  MyService({Key key, this.userModel}) : super(key: key);
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> 
{
  // Explicit

  //Method
  @override
  void initState() 
  {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('My service'),
      ), 
      body: Text('body'),
    );
  }
}