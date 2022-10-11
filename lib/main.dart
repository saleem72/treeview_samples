//

import 'package:flutter/material.dart';
import 'package:treeview_samples/routing/nav_links.dart';
import 'package:treeview_samples/routing/route_generator.dart';

void main() => runApp(const MainApplication());

class MainApplication extends StatelessWidget {
  const MainApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generate,
      initialRoute: NavLinks.initail,
    );
  }
}
