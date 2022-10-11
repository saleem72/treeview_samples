//

import 'package:flutter/material.dart';
import 'package:treeview_samples/routing/nav_links.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Tree View demo'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(NavLinks.neumorphisim),
              child: const Text(
                'Neumorphsim Screen',
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(NavLinks.glass),
              child: const Text(
                'Glass Screen',
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pushNamed(NavLinks.neon),
              child: const Text(
                'Neon Screen',
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(NavLinks.clipPath),
              child: const Text(
                'ClipPath Screen',
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(NavLinks.treeScreen),
              child: const Text(
                'Tree Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
