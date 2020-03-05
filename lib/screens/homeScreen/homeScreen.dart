import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Hello world',style: TextStyle(fontSize: 20,color: Colors.red),),
      ),
    );
  }
}

