import 'package:flutter/material.dart';
import '../common_colors.dart';

class Input extends StatefulWidget {
  final bool autofocus;
  final bool autovalidate;
  final String labelText;

  const Input({
    @required this.labelText,
    this.autofocus = false,
    this.autovalidate = false,
  });

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  bool get autofocus => widget.autofocus;
  bool get autovalidate => widget.autovalidate;
  String get labelText => widget.labelText;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      autovalidate: autovalidate,
      decoration: InputDecoration(
        labelText: labelText,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }
}