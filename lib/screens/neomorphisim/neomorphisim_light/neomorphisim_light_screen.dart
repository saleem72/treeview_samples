//

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

const Color lightBackground = Color(0xFFE7ECEF);
const Color darkBackground = Color(0xFF2E3239);

class NeumorphisimLightScreen extends StatelessWidget {
  const NeumorphisimLightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackground,
      appBar: AppBar(
        title: const Text('Neomorphis Light'),
      ),
      body: _buildWidgets(context),
    );
  }

  Widget _buildWidgets(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: _neomorphisinWidget(),
      ),
    );
  }

  Widget _neomorphisinWidget() {
    return const NeumorphisimWidget();
  }
}

class NeumorphisimWidget extends StatefulWidget {
  const NeumorphisimWidget({
    Key? key,
    // this.distance = const Offset(28, 28),
    // this.blur = 30,
    // this.darkShadowsColor = const Color(0xffA7A9AF),
  }) : super(key: key);

  @override
  State<NeumorphisimWidget> createState() => _NeumorphisimWidgetState();
}

class _NeumorphisimWidgetState extends State<NeumorphisimWidget> {
  bool isPressed = true;
  bool isDarkMode = true;

  double get blur => isPressed ? 5 : 30;
  Offset get distance =>
      isPressed ? const Offset(10, 10) : const Offset(28, 28);

  Color get darkShadowsColor =>
      isDarkMode ? const Color(0xff23262A) : const Color(0xffA7A9AF);
  Color get lightShadowsColor =>
      isDarkMode ? const Color(0xff35393F) : Colors.white;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (event) => setState(() {
        isPressed = false;
      }),
      onPointerDown: (event) => setState(() {
        isPressed = true;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: isDarkMode ? darkBackground : lightBackground,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                blurRadius: blur,
                offset: -distance,
                color: lightShadowsColor,
                inset: isPressed),
            BoxShadow(
              blurRadius: blur,
              offset: distance,
              color: darkShadowsColor,
              inset: isPressed,
            ),
          ],
        ),
      ),
    );
  }
}
