import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DrawingPageRaw extends StatefulWidget {
  @override
  _DrawingPageState createState() => _DrawingPageState();
}

class _DrawingPageState extends State<DrawingPageRaw> {
  List<Offset> _points = <Offset>[];
  String _last = "default";

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

  void _handleDown(PointerEvent details) {
    setState(() {
      _points = <Offset>[details.localPosition];
      _last = "handleDown";
    });
  }

  void _handleUpdate(PointerEvent details) {
    setState(() {
      _points = List.from(_points)..add(details.localPosition);
      _last = "handleUpdate";
    });
  }

  void _handleUp(PointerEvent details) {
    setState(() {
      _points.add(null);
      _last = "handleUp";
    });
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: <Type, GestureRecognizerFactory>{
        OnlyOnePointerRecognizer:
        GestureRecognizerFactoryWithHandlers<OnlyOnePointerRecognizer>(
              () => OnlyOnePointerRecognizer(),
              (OnlyOnePointerRecognizer instance) {
                instance.downCallback = _handleDown;
                instance.moveCallback = _handleUpdate;
                instance.upCallback = _handleUp;
          },
        ),
      },
      child: CustomPaint(
        painter: DrawingPainter(_points),
      ),
      // child: Container(
      //     width: 100.0,
      //     height: 100.0,
      //     color: Colors.yellow,
      //     alignment: Alignment.center,
      //     child: Text(_last)),
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

typedef EventCallback = void Function(PointerEvent pointerEvent);

class OnlyOnePointerRecognizer extends OneSequenceGestureRecognizer {
  int _p = 0;
  EventCallback downCallback;
  EventCallback moveCallback;
  EventCallback upCallback;

  @override
  void addPointer(PointerDownEvent event) {
    startTrackingPointer(event.pointer);
    if (_p == 0) {
      resolve(GestureDisposition.rejected);
      _p = event.pointer;
    } else {
      resolve(GestureDisposition.accepted);
    }
  }
    
  @override
  String get debugDescription => 'only one pointer recognizer';
    
  @override
  void didStopTrackingLastPointer(int pointer) {}
    
  @override
  void handleEvent(PointerEvent event) {
     if (event.pointer == _p) {
      if (event is PointerDownEvent) {
        // handle down event logic
        downCallback(event);
      } else if (event is PointerMoveEvent) {
        // handle move event logic
        moveCallback(event);
      } else if (event is PointerUpEvent) {
        // handle up event logic
        // reset pointer ID to 0
        upCallback(event);
        _p = 0;
      }
    }
  }
}