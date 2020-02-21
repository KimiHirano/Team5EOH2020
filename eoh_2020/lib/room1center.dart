import 'package:flutter/material.dart';
import 'room1left.dart';
import 'room1right.dart';
import 'room1bottom.dart';

class Room1CenterPage extends StatefulWidget {
  // Room1CenterPage({Key key, this.title}) : super(key: key);

  // final String title;

  @override
  _Room1CenterPageState createState() => _Room1CenterPageState();
}

class _Room1CenterPageState extends State<Room1CenterPage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'Left',
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Room1LeftPage()),
                      );
                  },
                  tooltip: 'Left',
                  child: 
                    Icon(Icons.keyboard_arrow_left),      
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to Escape Siebel',
                ),
                FloatingActionButton(
                  heroTag: 'Bottom',
                  onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Room1BottomPage()),
                      );
                  },
                  tooltip: 'Bottom',
                  child:Icon(Icons.keyboard_arrow_down),      
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: 'Right',
                  onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Room1RightPage()),
                      );
                  },
                  tooltip: 'Right',
                  child:Icon(Icons.keyboard_arrow_right),      
                ),
              ],
            )
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

