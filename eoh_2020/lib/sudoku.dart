import 'package:flutter/material.dart';
import 'room1center.dart';


class SudokuPage extends StatefulWidget{
  @override 
  _SudokuPageState createState() => _SudokuPageState();
}
class _SudokuPageState extends State<SudokuPage>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title:Text('Welcome to Soduku')),
    );
  }
}