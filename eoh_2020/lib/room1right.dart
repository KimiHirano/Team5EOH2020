import 'package:flutter/material.dart';

class Room1RightPage extends StatefulWidget {

  @override
  _Room1RightPageState createState() => _Room1RightPageState();
}

class _Room1RightPageState extends State<Room1RightPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Right Page')
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'Left',
                  onPressed: () {
                        Navigator.pop(context);
                  },
                  tooltip: 'Left',
                  child: 
                    Icon(Icons.keyboard_arrow_left),      
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


