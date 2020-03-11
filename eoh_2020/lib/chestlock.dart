import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'chest.dart';
import 'GlobalUtils.dart';

class Room1RightPageChest extends StatefulWidget {

  @override
  _Room1RightPageChestState createState() => _Room1RightPageChestState();
}

class _Room1RightPageChestState extends State<Room1RightPageChest> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override 
  void initState(){
    super.initState();
    _validateStatus();
  }
  
  _validateStatus() async {
    validateStatus(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
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
                  onSubmit: (String pin) => validatePIN(pin, context),
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

  validateStatus(BuildContext context){

    if(!GlobalUtils.hasUserProgressedPast(2)){

      Widget okButton = FlatButton(
        onPressed: () {Navigator.of(context).pop();}, 
        child: Text('OK')
      );

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('WARNING'),
          content: Text('Sorry, look like you haven''t solved all the puzzle yet.'),
          actions: <Widget>[okButton],
          )
      );
    }
  }

  validatePIN(String pin, BuildContext context){
    String expected = '1234';
    if(pin == expected){
       GlobalUtils.setUserProgress(3); //SOLVED_CHEST
       Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Chest()),);
    }else{
      final snackBar = SnackBar(
        content: Text('Wrong input. Value: $pin.\nPlease try again.',
                      style: TextStyle(fontSize: 20)
                  ),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
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