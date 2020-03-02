
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class Room1BottomPage extends StatefulWidget {
  @override
  _Room1BottomPageState createState() => _Room1BottomPageState();
}

class _Room1BottomPageState  extends State<Room1BottomPage>  {
  int numberOfTries = 0;
  int numberOfTimes = 3;

  var x = '69';
  var evar = 01000101; // 69    // E
  var ovar = 01001111; // 79    // O
  var hvar = 01001000; // 72    // H

  final guessedNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ulBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.greenAccent),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Welcome to the Binary Game'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                'Your job is to type out the binary of the corresponding number. You only have 3 tries.',
                style: TextStyle(
                    fontFamily: 'RobotCrush', 
                    fontSize: 20.0,
                    color: Colors.greenAccent),
              ),
            ),
             Align(
               alignment: Alignment.center,
               child: Container(
                   child: Text(
                     'Number: '+ x,
                     style: TextStyle(fontSize: 18.0,fontFamily: 'RobotCrush',color: Colors.greenAccent),
                   ),
               ),
             ),
            Container(
              child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: ulBorder,
                      focusedBorder: ulBorder,
                      hintText: 'Please enter binary',
                      hintStyle: TextStyle(fontSize: 15.0,fontFamily: 'RobotCrush', color: Colors.greenAccent),
                      ),
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.greenAccent,
                  style: TextStyle(color: Colors.greenAccent),
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  controller: guessedNumber),
            ),
            Container(
              child: RaisedButton(
                  child: new Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  color: Colors.greenAccent,
                  textColor: Colors.black,
                  onPressed: guess,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(12.0))),
            ),
              Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                ' Instructions on how to convert a number to binary: divide the number by 2, the remainder will be 0 or 1 and continue to divide till the division is zero.',
                style: TextStyle(
                    fontFamily: 'RobotCrush', 
                    fontSize: 15.0,
                    color: Colors.greenAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void guess() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    if (isEmpty()) {
      makeToast("You did not enter an answer");
      return;
    }

    int guess = int.parse(guessedNumber.text);
    if (guess.toString().length > 8) {
      makeToast("Your binary is too long!");
      guessedNumber.clear();
      return;
    }

    numberOfTries++;

  if (guess != evar){
    if(numberOfTimes == numberOfTries){
      makeToast('Aww you ran out of tries, but here is an E');
      numberOfTries = 0;
      guessedNumber.clear();
      return;
    }
    makeToast("Try again, your number of tries is $numberOfTries");
  } else{
    makeToast("That's correct, you earn an E.");
      x = '79';
      guessedNumber.clear();

  }

  if (guess != ovar){
    if(numberOfTimes == numberOfTries){
      makeToast('Aww you ran out of tries, but here is an O');
      numberOfTries = 0;
      guessedNumber.clear();
      return;
    }
      makeToast("Try again, your number of tries is $numberOfTries");
  } else{
    makeToast("That's correct, you earn an O.");
    x = '72';
    guessedNumber.clear();
  }

 if (guess != hvar){
   if(numberOfTimes == numberOfTries){
      makeToast('Aww you ran out of tries, but here is an H');
      numberOfTries = 0;
      guessedNumber.clear();
      return;
    }
      makeToast("Try again, your number of tries is $numberOfTries");
  } else{
    makeToast("That's correct, you earn an H. Congrats! You have collected all the letters. The projector turns on");
    guessedNumber.clear();
  }

  }

  void makeToast(String feedback) {
    Fluttertoast.showToast(
        msg: feedback,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        fontSize: 14);
  }

  bool isEmpty() {
    return guessedNumber.text.isEmpty;
  }
}



// class _Room1BottomPageState extends State<Room1BottomPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: new BoxDecoration(color: Colors.white),
//           child: Stack(
//             children: <Widget>[
//               Positioned.fill(
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: inputText((String text){
//                       print(text);
//                   }),
//                 ),
//               ),
//               // Positioned.fill(
//               //   child: Align(
//               //     alignment: Alignment.topCenter,
//               //     child: FloatingActionButton(
//               //       heroTag: 'Up',
//               //       onPressed: () {
//               //         Navigator.pop(context);
//               //       },
//               //       tooltip: 'Up',
//               //       child: Icon(Icons.keyboard_arrow_up),
//               //     ),
//               //   ),
//               // ),
//             ],
//         ),
//       ),
//     );
//   }
// }

// Widget inputText(Function doSomething) {
//   return Column(
//     children: [
//       Container(
//         width: 200,
//         child: TextField(
//           onChanged: (text) {
//             doSomething(text);
//           },
//         ),
//       )
//     ],
//   );
// }
