import 'package:flutter/material.dart';

class Room1BottomPage extends StatefulWidget {

  @override
  _Room1BottomPageState createState() => _Room1BottomPageState();
}

class _Room1BottomPageState extends State<Room1BottomPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Page')
      ),
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