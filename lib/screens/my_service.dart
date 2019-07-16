import 'package:flutter/material.dart';

class _MyService extends StatefulWidget 
{
  @override
  __MyServiceState createState() => __MyServiceState();
}

class __MyServiceState extends State<_MyService> 
{
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
