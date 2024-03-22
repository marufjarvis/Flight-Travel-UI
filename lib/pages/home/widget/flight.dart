// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class FlightWidget extends StatefulWidget {
  final double width;
  final EdgeInsets padding;
  final double punchRadius;
  final double borderRadius;
  // final double height;
  // final Widget child;
  final Widget top;
  final Widget bottom;
  final Color color;
  final bool isCornerRounded;

  const FlightWidget(
      {super.key,
      required this.width,
      // @required this.height,
      // @required this.child,
      required this.top,
      required this.bottom,
      required this.borderRadius,
      required this.punchRadius,
      this.padding = const EdgeInsets.all(5.0),
      this.color = Colors.white,
      this.isCornerRounded = false});

  @override
  _FlightWidgetState createState() => _FlightWidgetState();
}

class _FlightWidgetState extends State<FlightWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      // color: Colors.transparent,
      // elevation: 0,
      child: Container(
        padding: widget.padding,
        decoration: const BoxDecoration(
            // color: Colors.transparent,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(.04),
            //     blurRadius: 20,
            //     offset: const Offset(0.0, 0.0),
            //   ),
            //   BoxShadow(
            //       color: Colors.black.withOpacity(.05),
            //       blurRadius: 20,
            //       offset: const Offset(0.0, 10.0),
            //       spreadRadius: -15)
            // ]
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipPath(
              clipper: TicketClipper(widget.punchRadius),
              child: Column(
                children: <Widget>[
                  Container(
                    width: widget.width,
                    decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius:
                            BorderRadius.circular(widget.borderRadius)),
                    // minHeight: widget.height,
                    child: widget.top,
                  ),
                  SizedBox(
                    width: widget.width,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      child: Dash(
                        width: 6,
                        height: 1,
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // CustomPaint(painter: MyLinePainter()),
            ClipPath(
              clipper: TicketClipperBottom(widget.punchRadius),
              child: Container(
                // duration: Duration(seconds: 1),
                width: widget.width,
                decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(widget.borderRadius)),
                // minHeight: widget.height,
                child: widget.bottom,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  double punchRadius;
  TicketClipper(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: Offset(0.0, size.height), radius: punchRadius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TicketClipperBottom extends CustomClipper<Path> {
  double punchRadius;
  TicketClipperBottom(this.punchRadius);

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
        Rect.fromCircle(center: const Offset(0.0, 0), radius: punchRadius));
    path.addOval(
        Rect.fromCircle(center: Offset(size.width, 0), radius: punchRadius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class Dash extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const Dash(
      {super.key, this.height = 1, this.width = 3, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
