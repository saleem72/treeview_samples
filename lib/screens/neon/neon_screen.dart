//

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

final Color shadowColor = Colors.blueAccent.shade700;
Color backgroundColor = shadowColor.withOpacity(0.4);

class NeonScreen extends StatelessWidget {
  const NeonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00000F),
      body: _buildWidgets(context),
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return const Center(
      child: NeonWidget(),
    );
  }
}

class NeonWidget extends StatefulWidget {
  const NeonWidget({Key? key}) : super(key: key);

  @override
  State<NeonWidget> createState() => _NeonWidgetState();
}

class _NeonWidgetState extends State<NeonWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      onPointerUp: (_) => setState(() {
        isPressed = false;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isPressed ? backgroundColor : null,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            for (double i = 1; i < 5; i++)
              BoxShadow(
                color: shadowColor,
                blurRadius: i * (isPressed ? 5 : 3),
                inset: true,
              ),
            for (double i = 1; i < 5; i++)
              BoxShadow(
                spreadRadius: -1,
                color: shadowColor,
                blurRadius: i * (isPressed ? 5 : 3),
                blurStyle: BlurStyle.outer,
              ),
          ],
        ),
        child: TextButton(
          onHover: (hover) {
            setState(() {
              isPressed = hover;
            });
          },
          onPressed: () {},
          style: TextButton.styleFrom(
            side: const BorderSide(color: Colors.white, width: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              'Neon Effect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                shadows: [
                  for (double i = 1; i < (isPressed ? 8 : 4); i++)
                    Shadow(
                      color: shadowColor,
                      blurRadius: i * 3,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
