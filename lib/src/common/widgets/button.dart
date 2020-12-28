import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final bool autofocus;
  final String text;
  final Color textColor;
  final double radius;
  final Color color;
  final IconData icon;
  final Function onPressed;

  const Button({
    @required this.onPressed,
    @required this.text,
    this.color = const Color(0xFF00AC56),
    this.textColor,
    this.autofocus = false,
    this.icon,
    this.radius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      autofocus: autofocus,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              color: textColor
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          icon != null
            ? Icon(icon, color: textColor,)
            : Container(),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}