// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
//
// class DrawingPage extends StatefulWidget {
//   @override
//   _DrawingPageState createState() => _DrawingPageState();
// }
//
// class _DrawingPageState extends State<DrawingPageV2> {
//   final _points = <Offset>[];
//   final _team = GestureArenaTeam();
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureArena(
//       team: _team,
//       child: GestureDetector(
//         onPanStart: (details) {
//           GestureBinding.instance.gestureArena
//               .register(_team, addPointer: details.pointer);
//           setState(() {
//             _points.add(details.localPosition);
//           });
//         },
//         onPanUpdate: (details) {
//           setState(() {
//             _points.add(details.localPosition);
//           });
//         },
//         onPanEnd: (details) {
//           GestureBinding.instance.gestureArena
//               .unregister(_team, removePointer: details.pointer);
//           setState(() {
//             _points.add(null);
//           });
//         },
//         child: CustomPaint(
//           painter: LinePainter(_points),
//         ),
//       ),
//     );
//   }
// }
//
//
// class DrawingPageV2 extends StatefulWidget {
//   @override
//   _DrawingPageState createState() => _DrawingPageStateV2();
// }
//
// class _DrawingPageStateV2 extends State<DrawingPage> {
//   final _points = <Offset>[];
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanStart: (details) {
//         setState(() {
//           _points.add(details.localPosition);
//         });
//       },
//       onPanUpdate: (details) {
//         setState(() {
//           _points.add(details.localPosition);
//         });
//       },
//       onPanEnd: (details) {
//         setState(() {
//           _points.add(null);
//         });
//       },
//       child: CustomPaint(
//         painter: LinePainter(_points),
//       ),
//     );
//   }
// }
//
// class LinePainter extends CustomPainter {
//   final List<Offset> points;
//
//   LinePainter(this.points);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 4.0
//       ..strokeCap = StrokeCap.round;
//
//     final path = Path();
//     path.moveTo(points.first.dx, points.first.dy);
//     for (final point in points) {
//       path.lineTo(point.dx, point.dy);
//     }
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(LinePainter oldDelegate) {
//     return oldDelegate.points != points;
//   }
// }