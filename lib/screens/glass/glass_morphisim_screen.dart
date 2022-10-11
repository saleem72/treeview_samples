//

//

import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphisimScreen extends StatelessWidget {
  const GlassMorphisimScreen({Key? key}) : super(key: key);

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
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/bk.jpeg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 280,
          height: 200,
          child: GalssCard(),
        ),
      ),
    );
  }
}

class GalssCard extends StatelessWidget {
  const GalssCard({Key? key}) : super(key: key);
  // 'assets/images/noise.jpeg'
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/noise.jpeg',
              ),
              fit: BoxFit.cover,
              opacity: 0.1,
            ),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white60,
                Colors.white10,
              ],
            ),
            boxShadow: null, // _shadows(),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 2, color: Colors.white30),
          ),
          child: const Center(
            child: Text(
              'Glass',
              style: TextStyle(
                fontSize: 80,
                color: Colors.white54,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Add optinal shadow behind the card
  List<BoxShadow> _shadows() => [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 25,
          spreadRadius: -5,
        )
      ];
}
