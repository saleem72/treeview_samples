//

import 'package:flutter/material.dart';

import '../screens/all_screens.dart';

class RouteGenerator {
  static Route<dynamic>? generate(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case NavLinks.initail:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case NavLinks.neumorphisim:
        return MaterialPageRoute(
            builder: (_) => const NeumorphisimLightScreen());
      case NavLinks.glass:
        return MaterialPageRoute(builder: (_) => const GlassMorphisimScreen());
      case NavLinks.clipPath:
        return MaterialPageRoute(builder: (_) => const ClipPathScreen());
      case NavLinks.neon:
        return MaterialPageRoute(builder: (_) => const NeonScreen());
      case NavLinks.treeScreen:
        return MaterialPageRoute(builder: (_) => const TreeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => ErrorScren(
                  errorMessage: '${settings.name} is not valid route',
                ));
    }
  }
}

class ErrorScren extends StatelessWidget {
  const ErrorScren({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(''),
      ),
    );
  }
}
