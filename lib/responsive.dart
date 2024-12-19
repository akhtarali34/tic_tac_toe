
import 'exports.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 600.0;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600.0 &&
      MediaQuery.sizeOf(context).width < 1200.0;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1200.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        
        } else {
          return desktop;
        }
      },
    );
  }
}
