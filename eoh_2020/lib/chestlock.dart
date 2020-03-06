import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinput/pin_put/pin_put.dart';

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
          Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                child: PinPut(
                  fieldsCount: 4,
                  inputDecoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),
                  ),
                  textStyle: TextStyle(color: Colors.white),
                  onSubmit: (String pin) => validate(pin, context),
                ),
              ),
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
      ),
    );
  }

  // void createCircle(){
  //   new Container(
  //     decoration: new B,
  //   );
  // }

  void validate(String pin, BuildContext context){
    String expected = '1234';
    
    final snackBar = SnackBar(
      duration: Duration(seconds: 5),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text('Wrong input. Value: $pin,',
          style:  TextStyle(fontSize: 25.0, 
                  color: Colors.white
                  ),  
          ),
        ),
      ),
      backgroundColor: Colors.lightGreenAccent,
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
//   Widget patternlock() {
//     return Stack(
//       children: <Widget>[
//         Positioned(
//           child: GestureDetector(
//             onPanStart: (DragStartDetails details){
              
//             },
//             onPanUpdate: (DragUpdateDetails details) {

//             },
//             onPanEnd: (DragEndDetails details) {
              
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

// class Password{

//   int circle_amount;
//   List<int> expect = [];
//   Password(){};
// }