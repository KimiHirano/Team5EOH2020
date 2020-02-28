import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Room1RightPageChest extends StatefulWidget {

  @override
  _Room1RightPageChestState createState() => _Room1RightPageChestState();
}

class _Room1RightPageChestState extends State<Room1RightPageChest> {
  List<int> userInput = [];
  List<int> expected = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: new Image.asset('images/wood.jpg',
              width: size.width,
              height: size.height,
              fit:BoxFit.fill,
            ),
          ),
          Container(
            color: Color.fromRGBO(0, 0, 0, 0.8),
          ),
          // Positioned(
          //   child: Row(children: <Widget>[
          //     MaterialButton(
          //       shape: CircleBorder(),
          //       on
          //     ),

          //   ],),
          // ),
          Positioned.fill(
            child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
                      heroTag: 'Left',
                      onPressed: () {
                            Navigator.pop(context);
                      },
                      tooltip: 'Left',
                      child: 
                        Icon(Icons.keyboard_arrow_left),      
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget patternlock() {
    return Stack(
      children: <Widget>[
        Positioned(
          child: GestureDetector(
            onPanStart: (DragStartDetails details){
              
            },
            onPanUpdate: (DragUpdateDetails details) {

            },
            onPanEnd: (DragEndDetails details) {
              
            },
          ),
        ),
      ],
    );
  }
}