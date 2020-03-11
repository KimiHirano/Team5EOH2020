import 'dart:io';
import 'package:flutter/material.dart';
import 'GlobalUtils.dart';
import 'room1left.dart';

class Chest extends StatefulWidget {

  @override
  _ChestState createState() => _ChestState();
}

class _ChestState extends State<Chest> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.black,
          ),
          Positioned(
             child: MaterialButton(
                onPressed: (){
                  GlobalUtils.addItemToInventory(Item("Icard", "Key to unlock the door.", "images/icard.png"));
                  displaySnackBar(context);
                },
                elevation: 10.0,
                child: Image.asset('images/icard.png',height: 200,),
              ),
            bottom: size.height*0.32,
            left: size.width*0.04,
          ),
        ],
      ),
    );
   }

   displaySnackBar(BuildContext context){
     final snackBar = SnackBar(
        content: Text('Icard collected.\nYou can now unlock the door.',
                      style: TextStyle(fontSize: 20)
                  ),
        action: SnackBarAction(
          label: "OK",
          onPressed: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Room1LeftPage())
                  );
          },
        ),
     );
        _scaffoldKey.currentState.showSnackBar(snackBar);
   }
}