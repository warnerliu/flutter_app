import 'package:flutter/material.dart';
import 'package:flutter_app/gesture/arena_test.dart';
import 'package:flutter_app/gesture/raw_gesture.dart';

import 'drawing_widget.dart';

class DrawingPage extends StatelessWidget {
  final List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('drawing'),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          // child: DrawingScreen(),
          child: DrawingPageRaw(),
        );
      }),
    );
  }
}
