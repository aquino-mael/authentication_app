import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool autofocus;
  final String text;
  final double radius;
  final Color color;
  final IconData icon;
  final Function onPressed;

  const Button({
    @required this.onPressed,
    @required this.text,
    this.color = const Color(0xFF00AC56),
    this.autofocus = false,
    this.icon,
    this.radius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      autofocus: autofocus,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
          ),
          SizedBox(
            width: 16.0,
          ),
          icon != null
            ? Icon(icon)
            : Container(),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}