import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scratcher3/utils/scratch_numbers.dart';
import 'utils/random_number_generator.dart';
import 'utils/Scratcher.dart';
import 'package:scratcher/scratcher.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int winningNumber1;
  int winningNumber2;
  int number;
  Orientation orientation;
  List<ScratcherItem> scratchList;
  int winningCombinationPayout=0;
  List<GlobalKey<ScratcherState>> scratchKeys;
  final scratchKey0 = GlobalKey<ScratcherState>();
  final scratchKey1 = GlobalKey<ScratcherState>();
  final scratchKey2 = GlobalKey<ScratcherState>();
  final scratchKey3 = GlobalKey<ScratcherState>();
  final scratchKey4 = GlobalKey<ScratcherState>();
  final scratchKey5 = GlobalKey<ScratcherState>();
  final scratchKey6 = GlobalKey<ScratcherState>();
  final scratchKey7 = GlobalKey<ScratcherState>();
  final scratchKey8 = GlobalKey<ScratcherState>();
  final scratchKey9 = GlobalKey<ScratcherState>();
  int totalWinning = 0;
  int totalWinning2 =0;


  initState() {
    totalWinning2=totalWinning+totalWinning2;
    scratchKeys = new List<GlobalKey<ScratcherState>>();
    scratchKeys.add(scratchKey0);
    scratchKeys.add(scratchKey1);
    scratchKeys.add(scratchKey2);
    scratchKeys.add(scratchKey3);
    scratchKeys.add(scratchKey4);
    scratchKeys.add(scratchKey5);
    scratchKeys.add(scratchKey6);
    scratchKeys.add(scratchKey7);
    scratchKeys.add(scratchKey8);
    scratchKeys.add(scratchKey9);

    winningNumber1 = randomScratchNumberGenerator();
    winningNumber2 = randomScratchNumberGenerator();
    if (winningNumber2 == winningNumber1) {
      winningNumber2++;
    }
    if (winningNumber2 >= 21) {
      winningNumber2 - 2;
    }

    //create scratch list
    scratchList = new List<ScratcherItem>();
    bool allClear = false;
    for (int i = 1; i <= 8; i++) {
      allClear = true;
      ScratcherItem tempScratcherItem =
      new ScratcherItem(randomScratchNumberGenerator(), payoutGenerator());

      scratchList.add(tempScratcherItem);
    }
    cleanScratcherItem();
    checkWinningNumbers();
  }

  checkWinningNumbers() {
    for (var tempScratcherItem in scratchList) {
      if (tempScratcherItem.number == winningNumber1) {
        tempScratcherItem.isWinner = true;
      } else {
        if (tempScratcherItem.number == winningNumber2) {
          tempScratcherItem.isWinner = true;
        } else {
          tempScratcherItem.isWinner = false;
        }
      }
    }
  }

  cleanScratcherItem() {
    bool allClear = false;
    bool changedNumbers = false;
    do {
      allClear = true;
      for (var tempScratcherItem in scratchList) {
        if (scratchList != null) {
          int foundDupeNum = 0;
          for (ScratcherItem myTempScratcherItem in scratchList) {
            if (myTempScratcherItem.number == tempScratcherItem.number) {
              foundDupeNum++;
            }
          }
          if (foundDupeNum > 1) {
            allClear = false;
            if (tempScratcherItem.number == 20) {
              tempScratcherItem.number = tempScratcherItem.number - 1;
              changedNumbers = true;
            } else {
              tempScratcherItem.number = tempScratcherItem.number + 1;
              changedNumbers = true;
            }
          }
        }
        if (changedNumbers == false) {
          allClear == false;
        }
      }
    } while (allClear == false);
  }

//reset function
  reseter() {
    setState(() {
      //totalWinning2=totalWinning+totalWinning2;
      print(totalWinning);
      winningNumber1 = null;
      winningNumber2 = null;
      winningCombinationPayout = 0;
      scratchList = null;
      winningNumber1 = randomScratchNumberGenerator();
      winningNumber2 = randomScratchNumberGenerator();
      if (winningNumber2 == winningNumber1) {
        winningNumber2++;
      }
      if (winningNumber2 >= 21) {
        winningNumber2 - 2;
      }

      //create scratch list


      scratchList = new List<ScratcherItem>();
      bool allClear = false;

      for (int i = 1; i <= 8; i++) {
        allClear = true;
        ScratcherItem tempScratcherItem = new ScratcherItem(
            randomScratchNumberGenerator(), payoutGenerator());

        //winning assigner
        if (tempScratcherItem.number == winningNumber1) {
          tempScratcherItem.isWinner = true;
        } else {
          if (tempScratcherItem.number == winningNumber2) {
            tempScratcherItem.isWinner = true;
          } else {
            tempScratcherItem.isWinner = false;
          }
        }
        scratchList.add(tempScratcherItem);
      }
      cleanScratcherItem();
      checkWinningNumbers();
    });

    scratchKey0.currentState.reset(duration:const Duration(seconds: 1));
    scratchKey1.currentState.reset(duration:const Duration(seconds: 1));
    scratchKey2.currentState.reset(duration:const Duration(seconds: 1));
    scratchKey3.currentState.reset(duration:const Duration(seconds: 1));
    scratchKey4.currentState.reset(duration:const Duration(seconds: 1));
    scratchKey5.currentState.reset(duration:const Duration(seconds: 1));
    scratchKey6.currentState.reset(duration:const Duration(seconds: 1));
    scratchKey7.currentState.reset(duration:const Duration(seconds: 1));

    scratchKey0.currentState.thresholdReported =false;
    scratchKey1.currentState.thresholdReported = false;
    scratchKey2.currentState.thresholdReported = false;
    scratchKey3.currentState.thresholdReported = false;
    scratchKey4.currentState.thresholdReported = false;
    scratchKey5.currentState.thresholdReported = false;
    scratchKey6.currentState.thresholdReported = false;
    scratchKey7.currentState.thresholdReported = false;
  }

  //bottom orientation controlls
  Widget buttonPortait() {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () async {
            await _ackAlert(context);
          },
          child: Text('Collect winnings!'),
        ),
        RaisedButton(
          onPressed: reseter,
          child: Text('Reset'),
        )
      ],
    );
  }

  Widget buttonLandscape() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () async {
            await _ackAlert(context);
          },
          child: Text('Collect winnings!'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(2, 0, 2, 0),
        ),
        RaisedButton(
          onPressed: reseter,
          child: Text('Reset'),
        )
      ],
    );
  }

  //actuall app
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.monetization_on,
                  color: Colors.lightGreenAccent,
                  size: 36.0,
                ),
                new Text(
                  "CRATCHER",
                  style: new TextStyle(fontSize: 24.9),
                )
              ],
            ),
          ),
          actions: <Widget>[Padding(
            padding: const EdgeInsets.only(right:10.0),
            child: Icon(Icons.settings),
          )],
          leading: Padding(
            padding: const EdgeInsets.only(left:10.0),
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Total: \$$totalWinning2",
                )),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Text(
              'Winning Numbers',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                  color: Colors.blue,
                  child: Container(
                    child: Center(
                        child: Text(
                          '$winningNumber1',
                          style: TextStyle(fontSize: 20),
                        )),
                    width: MediaQuery.of(context).size.width * .4,
                  )),
              Card(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                          '$winningNumber2',
                          style: TextStyle(fontSize: 20),
                        )),
                    width: MediaQuery.of(context).size.width * .4,
                  )),
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Scratch Numbers',
              style: TextStyle(fontSize: 25),
            ),
          ),
          buildScratcherItem(context),
          Container(
              child: MediaQuery.of(context).orientation == Orientation.portrait
                  ? buttonPortait()
                  : buttonLandscape()),
        ],
      ),
    );
  }

  Widget buildScratcherItem(BuildContext context) {
    //CHECK OUT GRIDVEIW BUILDER
    return new Expanded(
      child: GridView.builder(
          itemCount: scratchList.length == null ? 0 : scratchList.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? 2
                  : 4),
          itemBuilder: (BuildContext context, int position) {
            ScratcherItem tempScratcherItem = scratchList[position];
            return  Card(
              elevation: 5.0,
              child: Scratcher(
                  key: scratchKeys[position],
                  threshold: 20,
                  color: Colors.greenAccent,
                  onThreshold: () {
                    if (tempScratcherItem.isWinner == true) {
                      winningCombinationPayout = winningCombinationPayout+ tempScratcherItem.payout;
                      totalWinning = tempScratcherItem.payout +totalWinning;
                    }

                    //ISSUE! totalWinning can be added to with every collect winnings cycle !Possible solution in scratcher.dart

//                    if (tempScratcherItem.isWinner == true) {
//                      winningCombinationPayout = tempScratcherItem.payout;
//                      totalWinning = totalWinning +winningCombinationPayout;
//                    }
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      Center(
                        child: Container(
                          child: Text(
                            ' ${tempScratcherItem.number}',
                            style: TextStyle(fontSize: 45),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      Container(
                        child: Text('${tempScratcherItem.payout}\$'),
                      )
                    ],
                  )),
            );
          }),
    );
  }

//collection button at bottom
  Future<void> _ackAlert(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Your winnings'),
          content: winningCombinationPayout == 0
              ? Text('You currently have won nothing. So sad!')
              : Text('Your current winnings are \$ $winningCombinationPayout'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                setState(() {
                  totalWinning2=totalWinning+totalWinning2;
                  totalWinning=0;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
