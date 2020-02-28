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
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/Room1LeftPic.jpg"), fit: BoxFit.cover
          )
        ),
        child: Container(
          child: Stack (
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
              ],
            ),
          ), 
        ),
     );
  }
}
