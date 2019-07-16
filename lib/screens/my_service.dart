import 'package:flutter/material.dart';
import 'package:put_foodthai/models/user_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'package:put_foodthai/screens/food_model.dart';

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
  List<FoodModel> foodModels = [];

  //Method
  @override
  void initState() 
  {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    print('Name = ${userModel.Name}');
    readAllData();
  }

  Future<void> readAllData() async
  {
    String url = 'https://www.androidthai.in.th/ooo/getAllFood.php';
    var response = await get(url);
    var result = json.decode(response.body);
    for (var parseJSON in result) 
    {
      FoodModel foodModel = FoodModel.formJSON(parseJSON);
      setState(() 
      {
        foodModels.add(foodModel);
      });
    }
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
      showTitle(),
      showUser()
    ],);
  }
  
  Widget showNameFood(int index)
  {
    return Container
    (
      alignment: Alignment.topLeft,
      child: Text
      (
        foodModels[index].NameFood,
        style: TextStyle
        (
          fontSize: 20.0, 
          color: Colors.black
        ),
      ),
    );
  }

  Widget showDetailFood(int index)
  {
    return Container
    (
      alignment: Alignment.topLeft,
      child: Text(foodModels[index].Detail),
    );
  }

  String detailShort(String detailString)
  {
    String result = detailString;
    if (detailString.length >= 30)
    {
      result = detailString.substring(0, 30);
      result = '$result...';
    }
    return result;
  }

  Widget showText(int index)
  {
    return Expanded
    (
      child: Column
      (
        children: <Widget>
        [
          showNameFood(index),
          showDetailFood(index)
        ],
      ),
    );  
  }

  Widget showImage(int index)
  {
    return Container
    (
      width: 10.0,
      height: 10.0,
      margin: EdgeInsets.all(6.0),
      child: Image.network
      (
        foodModels[index].ImagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showListView()
  {
    return ListView.builder
    (
      itemCount: foodModels.length,
      itemBuilder: (BuildContext context, int index)
      {
        return Container
        (
          alignment: Alignment.topLeft, 
          child: Row
          (
            children: <Widget>
            [
              showNameFood(index),
              showImage(index),
              showDetailFood(index)
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: titleAppBar(),
        backgroundColor: Colors.lightBlue,
      ), 
      body: showListView(),
    );
  }
}