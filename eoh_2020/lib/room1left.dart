import 'package:flutter/material.dart';

class Room1LeftPage extends StatefulWidget {

  @override
  _Room1LeftPageState createState() => _Room1LeftPageState();
}

class _Room1LeftPageState extends State<Room1LeftPage> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/Room1LeftPic.jpg"), fit: BoxFit.cover
            )
          ),
        child: MyStack()),
    );
  }
}

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Stack(
          children: <Widget>[
            Positioned (
                top: 50,
                bottom: 50,
                right: 10,
                child: FloatingActionButton(
                    heroTag: 'Right',
                    onPressed: () {
                          Navigator.pop(context);
                    },
                    tooltip: 'Right',
                    child: 
                      Icon(Icons.keyboard_arrow_right),      
                ),
              ),
              Positioned (
                top: 180,
                left: 100,
                width: 65,
                height: 115,
                child: Container (
                  child: GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        content:Text("Sorry, this door is locked.\nYou do not have the key.", style: new TextStyle(
                                fontSize: 25.0,), textAlign: TextAlign.center,),
                        duration: Duration(seconds: 3),);
                      Scaffold.of(context).showSnackBar(snackBar);
                    },
                  )
                ),
              ),
            ],
          ),
        );
    }
  }
