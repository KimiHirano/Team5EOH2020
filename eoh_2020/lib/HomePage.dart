import 'dart:ui';

import 'package:eoh_2020/room1center.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

//the start page for the escape room
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Size screen_size = MediaQuery.of(context).size;
    return Scaffold(

      body: Stack (
        children: <Widget>[

          //the background image
          Container (
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/siebel.jpg"),
                fit: BoxFit.cover,
                ),
            ),
          ),
          
          //ESCAPE FROM SIEBEL text
          Container(
            width: screen_size.width,
            height: 300,
            // alignment: MainAxisAlignment.center,
            padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Text(
                'Escape From Siebel',
                style: TextStyle(
                  fontFamily: 'RobotCrush', 
                  fontSize: 50,),
                textAlign: TextAlign.center,
              ),
          ),

          //enter button
          //uses positioned.fill so we can tap anywhere
          Positioned.fill (
            child: EnterButton(),
          )

        ],
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

//The Start Screen Start/Enter button
class EnterButton extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return GestureDetector (
      //when the button is tapped, enter the escape room
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Room1CenterPage()));
      },

      //the button
      child: Container (
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white10,
              ),
              child: Column (
                //center the button horizontally
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Tap anywhere to enter', 
                    style: TextStyle(
                      fontFamily: 'RobotCrush', 
                      fontSize: 30),
                    textAlign: TextAlign.center,),
                ],
              ),
              
      ), 

    );
  }
}

