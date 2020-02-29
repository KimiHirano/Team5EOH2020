import 'package:flutter/material.dart';

class Room1BottomPage extends StatefulWidget {
  @override
  _Room1BottomPageState createState() => _Room1BottomPageState();
}

class _Room1BottomPageState extends State<Room1BottomPage> {
  var evar = '0100'; // 4    // E
  var evar2 = '0101'; // 5

  var ovar = '0100'; // 4    // O
  var ovar2 = '1111'; // 15

  var hvar = '0100'; // 4    // H
  var hvar2 = '1000'; // 8

  var tvar = '0011'; // 3    // 2 x 2
  var tvar2 = '0010'; // 2

  var zvar = '0011'; // 3    // 0 x 2
  var zvar2 = '0000'; // 0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.white),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: inputText((String text){
                      print(text);
                  }),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: FloatingActionButton(
                    heroTag: 'Up',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    tooltip: 'Up',
                    child: Icon(Icons.keyboard_arrow_up),
                  ),
                ),
              ),
            ],
        ),
      ),
    );
  }
}

Widget inputText(Function doSomething) {
  return Column(
    children: [
      Container(
        width: 100,
        child: TextField(
          onChanged: (text) {
            doSomething(text);
          },
        ),
      )
    ],
  );
}

