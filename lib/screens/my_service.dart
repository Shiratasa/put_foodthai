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
  UserModel userModel;

  //Method
  @override
  void initState() 
  {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    print('Name = ${userModel.Name}');
  }

  Widget showTitle()
  {
    return Container
    (
      alignment: Alignment.topLeft, 
      child: Text('My Service'),
    );
  }

  Widget showUser()
  {
    return Container
    (
      alignment: Alignment.topLeft, 
      child: Text
      (
        '${userModel.Name} Login',
        style: TextStyle
        (
          fontSize: 16.0, 
          fontStyle: FontStyle.italic
        ),
      ),
    );
  }

  Widget titleAppBar()
  {
    return Column(children: <Widget>
    [
      showUser(),
      showUser()
    ],);
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: titleAppBar(),
      ), 
      body: Text('body'),
    );
  }
}