import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double width;
  final double height;
  final double stokeWidth;

  const CircularProgress(
      {super.key,
      this.width = 40.0,
      this.height = 40.0,
      this.stokeWidth = 2.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          backgroundColor: Colors.black87,
          strokeWidth: stokeWidth,
        ));
  }
}
