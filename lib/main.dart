import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _cidController = TextEditingController();
  var _urlController = TextEditingController();
  var responeData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: Column(
                children: [
                  TextField(
                    controller: _urlController,
                    decoration: InputDecoration(hintText: 'URL'),
                  ),
                  TextField(
                    controller: _cidController,
                    decoration: InputDecoration(hintText: 'input param'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30,right: 30),
              child: (responeData == null) ? Text('respone Data') : Text(responeData),
            ),
            RaisedButton(
                child: Text('Request'),
                onPressed: () async {
                  if (_cidController.text != null && _urlController.text !=null) {
                    var respData = await http.get(
                        _urlController.text +
                            _cidController.text);
                    var rowdata = utf8.decode(respData.bodyBytes);
                    responeData = rowdata.toString();
                    setState(() {});
                  }
                })
          ],
        ),
      ),
    );
  }
}
