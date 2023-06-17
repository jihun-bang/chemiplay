import 'package:flutter/material.dart';

class GigiTextField extends StatefulWidget {
  String? labelText, hintText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Icon suffixIcon;
  VoidCallback? onSuffixIconTap;
  bool? enabled;
  bool readOnly;
  TextEditingController textController;
  FloatingLabelBehavior? floatingLabelBehavior;

  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;

  GigiTextField({
    super.key,
    required this.textController,
    this.labelText,
    this.labelStyle = const TextStyle(
      color: Color(0xffAEB4BD),
    ),
    this.hintText,
    this.hintStyle,
    this.enabled = true,
    this.readOnly = false,
    this.suffixIcon = const Icon(
      Icons.cancel,
      color: Color(0xffaeb4bd),
      size: 24,
    ),
    this.onSuffixIconTap,
    this.onChanged,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.floatingLabelBehavior,
  });

  @override
  State<GigiTextField> createState() => _GigiTextFieldState();
}

class _GigiTextFieldState extends State<GigiTextField> {
  void _onClearTap() {
    widget.textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFFF8066);

    return TextField(
      readOnly: widget.readOnly,
      controller: widget.textController,
      keyboardType: widget.keyboardType,
      cursorColor: primaryColor,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffCED3D9),
            width: 3,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 3,
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: widget.onSuffixIconTap ?? _onClearTap,
          child: widget.suffixIcon,
        ),
        // contentPadding: const EdgeInsets.only(bottom: 10),
      ),
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      enabled: widget.enabled,
    );
  }
}
