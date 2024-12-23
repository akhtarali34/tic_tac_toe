
part of "home.dart";


class TabHome extends StatefulWidget {
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  int exScore = 0;
  int ohScore = 0;
  int filledBoxes = 0;

  bool ohTurn = true;
  List<String> displayExOh = ["", "", "", "", "", "", "", "", ""];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 2, 38, 68).withOpacity(0.9)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Column(
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(width * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Player X",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.white, shadows: [
                              for (double i = 1; i < 5; i++)
                                Shadow(
                                  color: Colors.yellow,
                                  blurRadius: 2 * i,
                                )
                            ]),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            exScore.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Player O",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.white, shadows: [
                              for (double i = 1; i < 5; i++)
                                Shadow(
                                  color: Colors.red,
                                  blurRadius: 2 * i,
                                )
                            ]),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            ohScore.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          _taped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white)),
                          child: Center(
                            child: Text(
                              displayExOh[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 40,
                                      shadows: [
                                    for (double i = 1; i < 5; i++)
                                      Shadow(
                                        color: displayExOh[index] == "x"
                                            ? Colors.red
                                            : Colors.green,
                                        blurRadius: 2 * i,
                                      )
                                  ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _taped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "o";
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "x";
        filledBoxes += 1;
      }

      ohTurn = !ohTurn;
      _checkWiner();
    });
  }

  void _checkWiner() {
    //check first row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      _showDialogue(displayExOh[0]);
    }
    //check second row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != "") {
      _showDialogue(displayExOh[3]);
    }
    //check Third row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != "") {
      _showDialogue(displayExOh[6]);
    }
    //check first Column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != "") {
      _showDialogue(displayExOh[0]);
    }
    //check second Column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != "") {
      _showDialogue(displayExOh[1]);
    }
    //check third Column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != "") {
      _showDialogue(displayExOh[2]);
    }
    //check first diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != "") {
      _showDialogue(displayExOh[0]);
    }
    //check second diagonal
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != "") {
      _showDialogue(displayExOh[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialogue();
    }
  }

  void _showDialogue(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
        backgroundColor: Colors.blue[700],
        shadowColor: Colors.yellow,
          title: Center(
            child: Text("The Winner is ${winner.toUpperCase()}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(
                      fontSize: 16,
                    color: Colors.yellow,
                    shadows: [
                      for (double i = 1; i < 4; i++)
                        Shadow(
                          color: Colors.red,
                          blurRadius: 3 * i,
                        ),
                    ],
                    )),
          ),
          actions:
           
           [
          const SizedBox(height: 10,),


              Center(
                child: CustomButton(
                    width: 120,
                    height: 40,
                    title: "Play Again",
                    onPressed: (){
                       _clearBoard();
                  Navigator.of(context).pop();
                    },
                  ),
              ),
                
          ],
        );
      },
    );
    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  _showDrawDialogue() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
           backgroundColor: Colors.blue[700],
        shadowColor: Colors.yellow,
          title: Text("DRAW",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontSize: 16,
                  color: Colors.white,
                  shadows: [
                    for (double i = 1; i < 4; i++)
                      Shadow(
                        color: Colors.green,
                        blurRadius: 3 * i,
                      ),
                  ],)),
          actions: [
           CustomButton(title: "Play Again", width: 120, height: 40, onPressed: (){
              _clearBoard();
                Navigator.of(context).pop();
           })
          ],
        );
      },
    );
  }

  _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = "";
      }
      filledBoxes = 0;
    });
  }
}
