import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DrawingPageV2 extends StatefulWidget {
  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPageV2> {
  List<Offset> _points = <Offset>[];

  void _handlePanStart(DragStartDetails details) {
    setState(() {
      _points = <Offset>[details.localPosition];
    });
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    setState(() {
      _points = List.from(_points)..add(details.localPosition);
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    setState(() {
      _points.add(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            AllowMultipleGestureRecognizer>(
          () => AllowMultipleGestureRecognizer(),
          (AllowMultipleGestureRecognizer instance) {
            instance.onStart = _handlePanStart;
            instance.onUpdate = _handlePanUpdate;
            instance.onEnd = _handlePanEnd;
          },
        ),
      },
      child: CustomPaint(
        painter: DrawingPainter(_points),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingPainter oldDelegate) {
    return oldDelegate.points != points;
  }
}

class AllowMultipleGestureRecognizer extends PanGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}