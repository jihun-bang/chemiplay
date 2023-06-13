import 'package:flutter/material.dart';

class GigiTextField extends StatefulWidget {
  String labelText, hintText;
  Icon suffixIcon;
  VoidCallback? onSuffixIconTap;
  bool? enabled;
  final void Function(String) onChanged;
  final TextInputType keyboardType;

  GigiTextField({
    super.key,
    this.labelText = '',
    this.hintText = '',
    this.enabled = true,
    this.suffixIcon = const Icon(
      Icons.cancel,
      color: Color(0xffaeb4bd),
      size: 24,
    ),
    this.onSuffixIconTap,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<GigiTextField> createState() => _GigiTextFieldState();
}

class _GigiTextFieldState extends State<GigiTextField> {
  final Color primaryColor = const Color(0xFFFF8066);
  final Color labelTextColor = const Color.fromARGB(255, 70, 70, 70);

  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void _onClearTap() {
    textController.clear();
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
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffCED3D9),
              width: 3,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 3,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: widget.onSuffixIconTap ?? _onClearTap,
            child: widget.suffixIcon,
          ),
          contentPadding: const EdgeInsets.only(bottom: 10)),
      onChanged: widget.onChanged,
      enabled: widget.enabled,
    );
  }
}
