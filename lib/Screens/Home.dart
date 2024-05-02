import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  const Home({Key?key}):super(key:key);

  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  // const _HomeState({Key?key}):super(key:key);

  @override 
  Widget build(BuildContext context)
  {
    return Scaffold( 
      body:
      Placeholder(
      color: Colors.blue,
      strokeWidth: 2.0,
      fallbackWidth: 400.0,
      fallbackHeight: 200.0,
    )
    );
  }
}