import 'package:flutter/material.dart';

class Authen extends StatefulWidget 
{
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> 
{
  // Explicit

  // Method

  Widget showLogo() 
  {
    return Container
    (
      width: 160.0,
      height: 160.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() 
  {
    return Text
    (
      'put_foodthai',
      style: TextStyle
      (
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
        fontFamily: 'Bahianita',
      ),
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: Container
      (
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column
        (
          children: <Widget>[showLogo(), showAppName()],
        ),
      )
    );
  }
}
