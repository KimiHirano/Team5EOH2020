import 'package:flutter/material.dart';
import 'room1center.dart';
import 'gamebottom.dart';


class SudokuPage extends StatefulWidget{
  @override 
  _SudokuPageState createState() => _SudokuPageState();
}
class _SudokuPageState extends State<SudokuPage>{
  List<GameButton> buttonsList;
  List<GameButton>selectedList;
  @override
  void initState() {
     
    super.initState();
    buttonsList = doInit();
    selectedList = doInit2();
  }
  List<GameButton>doInit2(){
    var selectButtons =<GameButton>[
     new GameButton(id: 5, icon:Image.asset('images/2.png'),enabled: false, number:2),
      new GameButton(id: 6,icon:Image.asset('images/1.png'),enabled: false, number:1),
      new GameButton(id: 7, icon:Image.asset('images/3.png'),enabled: false, number:3),
      new GameButton(id: 8,icon:Image.asset('images/4.jpg'),enabled: false, number:4),
    ];
    return selectButtons;
  }
  List<GameButton> doInit() {

    var gameButtons = <GameButton>[
      new GameButton(id: 1, enabled: true,number:2, correct: false),
      new GameButton(id: 2, icon:Image.asset('images/1.png'), number:1),
      new GameButton(id: 3, enabled: true, number:4,correct: false),
      new GameButton(id: 4, icon:Image.asset('images/3.png'), number:3),
      new GameButton(id: 5,icon:Image.asset('images/4.jpg'), number: 4),
      new GameButton(id: 6,enabled: true, number: 3,correct: false),
      new GameButton(id: 7,enabled: true, number: 1,correct: false),
      new GameButton(id: 8,icon:Image.asset('images/2.png'), number:2, correct: false),
      new GameButton(id: 9,enabled: true, number: 1,correct: false),
      new GameButton(id: 10,icon:Image.asset('images/2.png'), number:2),
      new GameButton(id: 11,enabled: true, number: 3,correct: false),
      new GameButton(id: 12, enabled: true, number:4,correct: false),
      new GameButton(id: 13, icon:Image.asset('images/3.png'), number:3),
      new GameButton(id: 14, enabled: true, number:4,correct: false),
      new GameButton(id: 15,icon:Image.asset('images/2.png'), number:2),
      new GameButton(id: 16, icon:Image.asset('images/1.png'), number:1),  
    ];
    return gameButtons;
  }
  void playGame(GameButton gb, List<GameButton> ba){
    setState(() {
      for(int i = 0; i < ba.length; i++){
        if (ba[i].enabled){
          gb.icon = ba[i].icon;
          if(ba[i].number == gb.number){
            gb.correct = true;
          }
        }
      }
    });
  }
  void setButton(List<GameButton> a, int m ) {
    setState(() {
      for (int i = 0; i < a.length; i++){
        if (i == m){
          a[i].enabled = true;
        } else {
        a[i].enabled = false;
        }
      }
    });
  }
  void checkGame() {
    for (int i = 0; i < buttonsList.length; i++) {
      if (!buttonsList[i].correct) {
        Text("Sorry,it's incorrect",
           style: TextStyle(fontWeight: FontWeight.bold),
           );
        }
      }
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title:Text('Welcome to Soduku')),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
         Container( 
          child:GridView.builder(
            shrinkWrap: true,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.0,
              crossAxisSpacing: 9.0,
              mainAxisSpacing: 9.0
              ), 
              itemCount: buttonsList.length,
            itemBuilder: (context,i) =>SizedBox(
              width: 50.0,
              height: 50.0,
              child: Material(
                color:Colors.green,
                elevation: 4.0,
                child:GestureDetector(
                  onTap:buttonsList[i].enabled?()=>playGame(buttonsList[i], selectedList):null,
                  child: buttonsList[i].icon,
                )
              )
              )
            ),
           
        ),
        Container(
          child:GridView.builder(
                shrinkWrap: true,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 9.0,
                  ),
                  itemCount: selectedList.length,
                itemBuilder:(context,i)=>SizedBox(
                  width:100.0,
                  child:Material(
                    color: Colors.green,
                    elevation: 4.0,
                    child: GestureDetector(
                      onTap:!selectedList[i].enabled?()=>setButton(selectedList, i):null,
                      child: selectedList[i].icon,
                    ),
                  )
                )
                ),
        ),
        RaisedButton(
              child: new Text(
                "check",
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              color: Colors.red,
              padding: const EdgeInsets.all(20.0),
              onPressed: checkGame,
            )
        ],
        )
    );
  }
}
