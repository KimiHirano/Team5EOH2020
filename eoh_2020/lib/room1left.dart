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
      appBar: AppBar(
        title: Text('Left Page')
      ),
      body: 

      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'Right',
                  onPressed: () {
                        Navigator.pop(context);
                  },
                  tooltip: 'Right',
                  child: 
                    Icon(Icons.keyboard_arrow_right),      
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
