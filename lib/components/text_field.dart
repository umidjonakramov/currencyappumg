import 'package:flutter/material.dart';


Widget InputText(String label, TextInputType type,
    TextEditingController controller, String prefix) {
  return Theme(
    data: ThemeData(
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        counterText: "",
          prefixText: prefix,
          ),
    ),
  );
}

class InputPass extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const InputPass({Key? key, required this.controller, required this.label}) : super(key: key);

  @override
  _InputPassState createState() => _InputPassState();
}

class _InputPassState extends State<InputPass> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: ThemeData(
        ),
        child: TextField(
          controller: widget.controller,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_isVisible,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
            ),
            labelText: widget.label,
            focusedBorder: const OutlineInputBorder(
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Icon(
                _isVisible ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
        ),
      ),
    );
  }
}