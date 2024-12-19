import 'package:tic_tac_toe/exports.dart';




part 'mobile_home.dart';
part 'tab_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Responsive(

      mobile: MobileHome(),
      desktop: TabHome(),
      
    );
  }
}
