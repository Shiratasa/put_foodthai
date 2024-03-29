//ctrl + .
import 'package:flutter/material.dart';
import 'package:put_foodthai/models/user_model.dart';
import 'package:put_foodthai/screens/my_service.dart';
import 'package:put_foodthai/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

//stl
class Authen extends StatefulWidget 
{
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> 
{
  // Explicit
  final formKey = GlobalKey<FormState>();
  String user, password;

  // Method
  Widget signInButton() 
  {
    return RaisedButton
    (
      color: Colors.green,
      child: Text
      (
        'Sign in',
        style: TextStyle
        (
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
      onPressed: () 
      {
        print('Sign in activated!');
        if (formKey.currentState.validate()) 
        {
          formKey.currentState.save();
          print('user = $user, password = $password');
          authentication();
        }
      },
    );
  }

  Future<void> authentication()async
  {
    String urlString = 'https://www.androidthai.in.th/ooo/getUserWhereUserPUT.php?isAdd=true&User=$user';
    var response = await get(urlString);
    var result = json.decode(response.body);
    print('Authorizing...');
    if ((result.toString()) == 'null') 
    {
      print('Invalid username!');
      myAlertDialog('Invalid username!', 'Username "$user" was not found in our database directory');
    }
    else
    {
      print('User account: $result');
      for (var myParseJSON in result) 
      {
        UserModel userModel = UserModel.parseJSON(myParseJSON);
        String truePassword = userModel.Password;
        if (password == truePassword) 
        {
          print('Welcome back!');
          var myServiceRoute = MaterialPageRoute
          (
            builder: (BuildContext context) => 
            MyService(userModel: userModel)
          ); 
          Navigator.of(context).pushAndRemoveUntil
          (
            myServiceRoute, (Route<dynamic> route) => false
          );
        } 
        else 
        {
          print('Invalid password!');
          myAlertDialog('Invalid password!', 'Please recheck and input your password again');
        }
      }
    }
  }

  void myAlertDialog(String titleString, String messageString)
  {
    showDialog
    (
      context: context, 
      builder: (BuildContext context)
      {
        return AlertDialog
        (
          title: Text
          (
            titleString, 
            style: TextStyle(color: Colors.red),
          ),
          content: Text(messageString),
          actions: <Widget>[alertButton()],
        );
      },
    );
  }

  Widget alertButton()
  {
    return FlatButton
    (
      child: Text('OK'),
      onPressed: ()
      {
        Navigator.of(context).pop();
      },
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
          fontSize: 15.0,
        ),
      ),
      onPressed: () 
      {
        print('Sign up activated!');
        var registerRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
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
          Expanded
          (
            child: signInButton(),
          ),
          mySizeBox2(),
          Expanded
          (
            child: signUpButton(),
          ),
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
          return 'Please input your username...';
        },
        onSaved: (String value) 
        {
          user = value;
        },
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
        obscureText: true,
        decoration: InputDecoration
        (
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
          ),
        ),
        validator: (String value) 
        {
          if (value.isEmpty) 
          return 'Please input your password...';
        },
        onSaved: (String value) 
        {
          password = value;
        },
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
      height: 25.0,
      width: 25.0,
    );
  }

  Widget mySizeBox3() 
  {
    return SizedBox
    (
      height: 50.0,
      width: 50.0,
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
      '         PUT thaifood         ', 
      style: TextStyle
      (
        fontSize: 50.0,
        fontWeight: FontWeight.bold,
        color: Colors.lightBlue,
        fontFamily: 'Bahianita',
        // Alignment center?
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
            colors: 
            [
              Colors.grey,
              Colors.white,
              Colors.grey,
              Colors.white,
              Colors.grey,  
            ],
            begin: Alignment.topLeft,
          ),
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        child: Form
        (
          key: formKey,
          child: Column
          (
            children: <Widget>
            [
              showLogo(),
              mySizeBox(),
              showAppName(),
              mySizeBox2(),
              userText(),
              mySizeBox2(),
              passwordText(),
              mySizeBox3(),
              showButton(),
              mySizeBox3()
            ],
          ),
        ),
      ),
    );
  }
}
