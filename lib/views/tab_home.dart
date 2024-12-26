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
  int gamelevel = 3;

  bool ohTurn = true;
  late List<String> displayExOh;

  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

  void _initializeBoard() {
    displayExOh = List<String>.filled(gamelevel * gamelevel, "");
    filledBoxes = 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

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
                      _buildScoreBoard(
                          context, "Player X", exScore, Colors.yellow),
                      _buildScoreBoard(
                          context, "Player O", ohScore, Colors.red),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: GridView.builder(
                    itemCount: gamelevel * gamelevel,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gamelevel,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          title: "Easy",
                          width: 80,
                          height: 40,
                          shadowColor: Colors.green,
                          onPressed: () {
                            setState(() {
                              gamelevel = 3;
                              _initializeBoard();
                            });
                          }),
                      CustomButton(
                          title: "Medium",
                          width: 90,
                          height: 40,
                          shadowColor: Colors.yellow,
                          onPressed: () {
                            setState(() {
                              gamelevel = 5;
                              _initializeBoard();
                            });
                          }),
                      CustomButton(
                          title: "Hard",
                          width: 80,
                          height: 40,
                          onPressed: () {
                            setState(() {
                              gamelevel = 7;
                              _initializeBoard();
                            });
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScoreBoard(
      BuildContext context, String player, int score, Color shadowColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            player,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              shadows: [
                for (double i = 1; i < 5; i++)
                  Shadow(
                    color: shadowColor,
                    blurRadius: 2 * i,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            score.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void _taped(int index) {
    if (displayExOh[index] == "") {
      setState(() {
        displayExOh[index] = ohTurn ? "o" : "x";
        filledBoxes++;
        ohTurn = !ohTurn;
        _checkWiner();
      });
    }
  }

  void _checkWiner() {
    List<List<int>> winPatterns = _generateWinPatterns();

    // Check for a winner in all patterns
    for (var pattern in winPatterns) {
      if (pattern.every((index) => displayExOh[index] == "x")) {
        _showDialogue("x");
        return;
      } else if (pattern.every((index) => displayExOh[index] == "o")) {
        _showDialogue("o");
        return;
      }
    }

    // If all boxes are filled and no winner
    if (filledBoxes == gamelevel * gamelevel) {
      _showDrawDialogue();
    }
  }

  List<List<int>> _generateWinPatterns() {
    List<List<int>> patterns = [];

    // Rows
    for (int i = 0; i < gamelevel; i++) {
      patterns.add(List.generate(gamelevel, (j) => i * gamelevel + j));
    }

    // Columns
    for (int i = 0; i < gamelevel; i++) {
      patterns.add(List.generate(gamelevel, (j) => j * gamelevel + i));
    }

    // Diagonal 1
    patterns.add(List.generate(gamelevel, (i) => i * (gamelevel + 1)));

    // Diagonal 2
    patterns.add(List.generate(gamelevel, (i) => (i + 1) * (gamelevel - 1)));

    return patterns;
  }

  void _showDialogue(String winner) {
    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue[700],
          shadowColor: Colors.yellow,
          title: Center(
            child: Text("The Winner is ${winner.toUpperCase()}",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
          actions: [
            Center(
              child: CustomButton(
                width: 120,
                height: 40,
                title: "Play Again",
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDrawDialogue() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.blue[700],
          shadowColor: Colors.yellow,
          title: Text("DRAW",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 16,
                color: Colors.white,
                shadows: [
                  for (double i = 1; i < 4; i++)
                    Shadow(
                      color: Colors.green,
                      blurRadius: 3 * i,
                    ),
                ],
              )),
          actions: [
            CustomButton(
                title: "Play Again",
                width: 120,
                height: 40,
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                })
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      _initializeBoard();
    });
  }
}
