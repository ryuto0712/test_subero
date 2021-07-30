import '../../importer.dart';

class BubbleBorder extends ShapeBorder {
  final bool usePadding;

  const BubbleBorder({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(left: usePadding ? 12 : 0);
  // EdgeInsets.only(bottom: usePadding ? 12 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final r = Rect.fromPoints(rect.topLeft + const Offset(12, 0), rect.bottomRight);
    // Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 12));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(r, Radius.circular(5)))
      ..moveTo(r.bottomLeft.dx, r.topLeft.dy + 20)
      // ..moveTo(r.bottomLeft.dx, r.center.dy)
      // ..moveTo(r.bottomLeft.dx, r.bottomCenter.dy)
      ..relativeLineTo(0, -12)
      ..relativeLineTo(-12, 6)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
