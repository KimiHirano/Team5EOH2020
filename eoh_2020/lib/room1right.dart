import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'chestlock.dart';

class Room1RightPage extends StatefulWidget {

  @override
  _Room1RightPageState createState() => _Room1RightPageState();
}

class _Room1RightPageState extends State<Room1RightPage> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Center(
            child: new Image.asset('images/tables.jpg',
            width: size.width,
            height: size.height,
            fit:BoxFit.fill,
          ),
          ),
          Positioned(
            child:AvatarGlow(
              startDelay: Duration(milliseconds: 1000),
              glowColor: Colors.yellow,
              endRadius: 160.0,
              duration: Duration(milliseconds: 2000),
              repeat: true,
              showTwoGlows: true,
              repeatPauseDuration: Duration(milliseconds: 100),
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Room1RightPageChest()),
                  );
                },
                elevation: 10.0,
                child: Image.asset('images/chest.png',height: 200,),
              ),
              shape: BoxShape.circle,
              animate: true,
              curve: Curves.fastOutSlowIn,
            ),
            bottom: 240,
            left: 10,
          ),
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
        overflow: Overflow.clip,
     ),
    );
  }
}


