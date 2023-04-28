import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class DrawingScreen extends StatefulWidget {
  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset> _points = [];
  GestureArenaTeam gestureArenaTeam = GestureArenaTeam();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: DrawingWidget(points: _points),
      // ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: DrawingWidget(points: _points),
        );
      }),
    );
  }
}

class DrawingWidget extends StatelessWidget {
  final List<Offset> points;

  DrawingWidget({this.points});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onPanUpdate: (details) {
        RenderBox referenceBox = context.findRenderObject();
        Offset localPosition =
            referenceBox.globalToLocal(details.globalPosition);
        print(localPosition);
        points.add(localPosition);
        // Call setState() to rebuild the widget tree and trigger repaint
        (context as Element).markNeedsBuild();
      },
      onPanEnd: (details) {},
      child: CustomPaint(
        painter: DrawingPainter(points: points),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset> points;

  DrawingPainter({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) => true;
}
