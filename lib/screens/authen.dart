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
  Widget signInButton()
  {
    return RaisedButton
    (
      color: Colors.green,
      child: Text
      ('Sign in', 
       style: TextStyle
       (
         color: Colors.purple,

       ), 
      ),
      onPressed: () {},
    );
  }

    Widget signUpButton()
  {
    return RaisedButton
    (
      color: Colors.yellow,
      child: Text
      (
        'Sign up',
        style: TextStyle
        (
          color: Colors.red,

        ), 
      ), 
      onPressed: () {},
    );
  }

  Widget showButton()
  {
    return Container
    (
      width: 250.0, 
      child: Row
      (
        children: <Widget>
        [
          Expanded(child: signInButton(), ),
          mySizeBox(),
          Expanded(child: signUpButton(), ),
        ], 
      ),
    );
  }

  Widget userText()
  {
    return Container
    (
      width: 250.0,
      child: TextFormField
      (
        decoration: InputDecoration
        (
          labelText: 'User :',
          hintText: 'Input your username', 
          labelStyle: TextStyle
          (
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ), 
    );
  }

    Widget passwordText()
  {
    return Container
    (
      width: 250.0,
      child: TextFormField
      (
        decoration: InputDecoration
        (
          labelText: 'Password :',
          hintText: 'Input your password', 
          labelStyle: TextStyle
          (
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ), 
    );
  }

  Widget mySizeBox()
  {
    return SizedBox
    (
      height: 5.0, 
      width: 5.0, 
    );
  }

    Widget mySizeBox2()
  {
    return SizedBox
    (
      height: 20.0, 
      width: 20.0, 
    );
  }

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
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlue,
        fontFamily: 'Bahianita',
      ),
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      resizeToAvoidBottomPadding: false,
      body: Container
      (
        decoration: BoxDecoration
        (
          gradient: LinearGradient
          (
            colors: [Colors.white, Colors.grey],
            begin: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column
        (
          children: <Widget>
          [
            showLogo(), 
            mySizeBox(), 
            showAppName(),
            mySizeBox2(),
            userText(),
            passwordText(),
            mySizeBox2(), 
            showButton(),
          ],
        ),
      )
    );
  }
}
