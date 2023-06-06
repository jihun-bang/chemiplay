import 'package:flutter/material.dart';

class GigiTextField extends StatefulWidget {
  final String labelText, hintText;
  final void Function(String) onChange;
  final TextInputType keyboardType;
  const GigiTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.onChange,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<GigiTextField> createState() => _GigiTextFieldState();
}

class _GigiTextFieldState extends State<GigiTextField> {
  final Color primaryColor = const Color(0xFFFF8066);
  final Color labelTextColor = const Color.fromARGB(255, 70, 70, 70);
  late final TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      keyboardType: widget.keyboardType,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: labelTextColor,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 3,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 3,
          ),
        ),
      ),
      onChanged: widget.onChange,
    );
  }
}
