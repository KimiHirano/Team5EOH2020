import 'package:flutter/material.dart';

class Room1BottomPage extends StatefulWidget {

  @override
  _Room1BottomPageState createState() => _Room1BottomPageState();
}

class _Room1BottomPageState extends State<Room1BottomPage> {
  int evar = 0100;         // 4    // E
  int evar2 = 0101;        // 5

  int ovar = 0100;         // 4    // O
  int ovar2 = 1111;        // 15

  int hvar = 0100;         // 4    // H
  int hvar2 = 1000;        // 8

  int tvar = 0011;         // 3    // 2 x 2
  int tvar2 = 0010;        // 2

  int zvar = 0011;         // 3    // 0 x 2
  int zvar2 = 0000;        // 0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(
       // title: Text('Bottom Page')
     // ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'Up',
                  onPressed: () {
                        Navigator.pop(context);
                  },
                  tooltip: 'Up',
                  child: 
                    Icon(Icons.keyboard_arrow_up),      
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}