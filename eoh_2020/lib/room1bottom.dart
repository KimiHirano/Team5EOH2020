
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

  var x = '9';
  var evar = 1001; // 9    // E
  var ovar = 10100; // 20    // O
  var hvar = 1100; // 12    // H

  final guessedbinary = new TextEditingController();

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
                  controller: guessedbinary,)
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
                    fontSize: 13.0,
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

    int guess = int.parse(guessedbinary.text);
    if (guess.toString().length > 5) {
      makeToast("Your binary is too long!");
      guessedbinary.clear();
      return;
    }

  numberOfTries++;

  if(guess == evar){
    makeToast("That's correct, you earn an E.");
      setState((){
        x = '20';
        });
      guessedbinary.clear();

  }else if (guess == ovar) {
       makeToast("That's correct, you earn an O.");
    setState((){
      x = '12';
    });
    guessedbinary.clear();

  } else if (guess == hvar){
    makeToast("That's correct, you earn an H. Congrats! You have collected all the letters. The projector turns on");
    guessedbinary.clear();

  } else if (guess != evar && guess != ovar && guess != hvar){
    if(numberOfTimes == numberOfTries){
      makeToast('Aww you ran out of tries, but here is an letter');
      numberOfTries = 0;
      guessedbinary.clear();
      return;
    }
    makeToast("Try again, your number of tries is $numberOfTries");
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
    return guessedbinary.text.isEmpty;
  }
}

