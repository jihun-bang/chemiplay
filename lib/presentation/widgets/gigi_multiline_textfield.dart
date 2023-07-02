import 'package:flutter/material.dart';

class GigiMultilineTextField extends StatefulWidget {
  final TextEditingController textController;
  final void Function(String) onChanged;
  final int maxLength;
  final String labelText;

  const GigiMultilineTextField({
    super.key,
    required this.textController,
    required this.onChanged,
    required this.maxLength,
    required this.labelText,
  });

  @override
  State<GigiMultilineTextField> createState() => _GigiMultilineTextFieldState();
}

class _GigiMultilineTextFieldState extends State<GigiMultilineTextField> {
  final Color primaryColor = const Color(0xFFFF8066);
  bool isNeedToShowIntroductionLableText = true;

  void _setIsNeedToShowIntroductionLableText(bool value) {
    if (isNeedToShowIntroductionLableText != value) {
      setState(() {
        isNeedToShowIntroductionLableText = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            color: Color(0xffF5F7FA),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: TextField(
            controller: widget.textController,
            decoration: const InputDecoration(
              counterText: '',
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
            keyboardType: TextInputType.multiline,
            cursorColor: primaryColor,
            minLines: 3,
            maxLines: 10,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            onTap: () => _setIsNeedToShowIntroductionLableText(false),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Text(
            widget.labelText,
            style: TextStyle(
              color: isNeedToShowIntroductionLableText == false
                  ? Colors.transparent
                  : const Color(0xffCED3D9),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: Text(
            '${widget.textController.text.length}/${widget.maxLength}',
            style: const TextStyle(
              color: Color(0xffAEB4BD),
            ),
          ),
        ),
      ],
    );
  }
}
