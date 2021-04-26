import 'package:flutter/material.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width,
    this.height = 46.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      child: Container(
        width: width,
        height: 50.0,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(183, 69, 135, 0.4),
                blurRadius: 1.9,
                spreadRadius: 3,
                offset: Offset(0, 2)),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onPressed,
              child: Center(
                child: child,
              )),
        ),
      ),
    );
  }
}
