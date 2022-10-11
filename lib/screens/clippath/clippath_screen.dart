//

import 'package:flutter/material.dart';

class ClipPathScreen extends StatelessWidget {
  const ClipPathScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildWidgets(context),
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrange.shade300,
      ),
      alignment: Alignment.center,
      child: Column(
        children: const [
          SizedBox(
            height: 300,
            child: ClipPathWidget(),
          ),
        ],
      ),
    );
  }
}

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipPath(),
      child: Container(
        color: Colors.purple,
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.5, height - 100, width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
