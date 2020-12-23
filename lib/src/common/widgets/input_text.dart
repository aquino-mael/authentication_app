import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final bool autofocus;
  final bool autovalidate;
  final String labelText;

  const InputText({
    @required this.labelText,
    this.autofocus = false,
    this.autovalidate = false,
  });

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          gapPadding: 5.0
        ),
      ),
    );
  }
}