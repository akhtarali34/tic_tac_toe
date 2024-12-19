
import 'package:tic_tac_toe/views/home.dart';

import 'exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'orgainic milk',
      theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontSize: Responsive.isDesktop(context)
                  ? height * 0.048
                  : Responsive.isTablet(context)
                      ? height * 0.032
                      : height * 0.028,
              fontWeight: FontWeight.w700,
            ),
            headlineMedium: TextStyle(
              fontSize: Responsive.isDesktop(context)
                  ? height * 0.038
                  : Responsive.isTablet(context)
                      ? height * 0.028
                      : height * 0.024,
              fontWeight: FontWeight.w700,
            ),
            headlineSmall: TextStyle(
              fontSize: Responsive.isDesktop(context)
                  ? height * 0.032
                  : Responsive.isTablet(context)
                      ? height * 0.024
                      : height * 0.020,
              fontWeight: FontWeight.w500,
            ),
            bodyLarge: TextStyle(
              fontSize: Responsive.isDesktop(context)
                  ? height * 0.024
                  : Responsive.isTablet(context)
                      ? height * 0.018
                      : height * 0.016,
              fontWeight: FontWeight.w500,
            ),
            bodyMedium: TextStyle(
              fontSize: Responsive.isDesktop(context)
                  ? height * 0.020
                  : Responsive.isTablet(context)
                      ? height * 0.016
                      : height * 0.014,
              fontWeight: FontWeight.w400,
            ),
            bodySmall: TextStyle(
              fontSize: Responsive.isDesktop(context)
                  ? height * 0.016
                  : Responsive.isTablet(context)
                      ? height * 0.014
                      : height * 0.012,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      home: const  HomePage(),
    );
  }
}
