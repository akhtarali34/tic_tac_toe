import 'package:tic_tac_toe/exports.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.sizeOf(context).height;

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

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Tic",
                  style:Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        for (double i = 1; i < 8; i++)
                          Shadow(
                            color: Colors.red,
                            blurRadius: 2 * i,
                          )
                      ]
                  ),
                ),
                Text(
                  "Tac",
                  style:Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        for (double i = 1; i < 8; i++)
                          Shadow(
                            color: Colors.yellow,
                            blurRadius: 2 * i,
                          )
                      ]
                  ),
                ),
                Text(
                  "Toe",
                  style:Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      shadows: [
                        for (double i = 1; i < 8; i++)
                          Shadow(
                            color: const Color.fromARGB(255, 83, 249, 89),
                            blurRadius: 2 * i,
                          )
                      ]
                  ),
                ),
                SizedBox(height: height*0.05,),
                CustomButton(
                  width: 200,
                  height: 50,
                  title: "Play With Human",
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                  },
                ),
                const SizedBox(height:20),
                CustomButton(
                  width: 200,
                  height: 50,
                  title: "Play With Computer",
                  shadowColor: Colors.yellow,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
                  },
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
