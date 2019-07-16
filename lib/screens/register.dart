import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget 
{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> 
{
  // Explicit
  final formKey = GlobalKey<FormState>();
  String name, user, password;

  // Method
  Widget nameText() 
  {
    return TextFormField
    (
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration
      (
        icon: Icon
        (
          Icons.face,
          size: 36.0,
          color: Colors.black,
        ),
        labelText: 'Name :',
        hintText: 'Input your full name',
        labelStyle: TextStyle
        (
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        hintStyle: TextStyle
          (
            fontStyle: FontStyle.italic,
          ),
        helperText: '',
        helperStyle: TextStyle
        (
          color: Colors.red,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) 
      {
        if (value.isEmpty) 
        return 'Please input your fullname...';
      },
      onSaved: (String value)
      {
        name = value;
      },
    );
  }

  Widget userText() 
  {
    return TextFormField
    (
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration
      (
          icon: Icon
          (
            Icons.account_circle,
            size: 36.0,
            color: Colors.black,
          ),
          labelText: 'User :',
          hintText: 'Input your username',
          labelStyle: TextStyle
          (
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          hintStyle: TextStyle
          (
            fontStyle: FontStyle.italic,
          ),
          helperText: '',
          helperStyle: TextStyle
          (
            color: Colors.red,
            fontStyle: FontStyle.italic,
          )
      ),
      validator: (String value) 
      {
        if (value.isEmpty) 
        return 'Please input your username...';
      },
      onSaved: (String value) 
      {
        user = value;
      },
    );
  }

  Widget paswordText() 
  {
    return TextFormField
    (
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration
      (
          icon: Icon
          (
            Icons.lock,
            size: 36.0,
            color: Colors.black,
          ),
          labelText: 'Password :',
          hintText: 'Input your password',
          labelStyle: TextStyle
          (
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          hintStyle: TextStyle
          (
            fontStyle: FontStyle.italic,
          ),
          helperText: '',
          helperStyle: TextStyle
          (
            color: Colors.red,
            fontStyle: FontStyle.italic,
          )),
      validator: (String value) 
      {
        if (value.isEmpty) 
        return 'Please input your password...';
      },
      onSaved: (String value) 
      {
        password = value;
      },
    );
  }

  Widget uploadButton() 
  {
    return IconButton
    (
      icon: Icon(Icons.cloud_upload, size: 36.0,),
      onPressed: () 
      {
        print('Upload activated!');
        if (formKey.currentState.validate()) 
        {
          formKey.currentState.save();
          print('name = $name, user = $user, password = $password');
          registerToServer();
        }
      },
    );
  }

  Future<void> registerToServer()async
  {
    String urlString = 'https://www.androidthai.in.th/ooo/addDataPUT.php?isAdd=true&Name=$name&User=$user&Password=$password';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('result = $result');
  }

  Widget mySizeBox() 
  {
    return SizedBox
    (
      height: 25.0,
      width: 25.0,
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        backgroundColor: Colors.lightBlue,
        title: Text('Register'),  
        actions: <Widget>
        [
          uploadButton(),
        ],
      ),
      body: Container
      (
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        child: Form
        (
          key: formKey,
          child: ListView
          (
            children: <Widget>
            [
              nameText(),
              mySizeBox(), 
              userText(),
              mySizeBox(),
              paswordText(),
            ],
          ),
        ),
      ),
    );
  }
}
