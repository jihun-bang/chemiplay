import 'package:flutter/material.dart';

class BottomNextButton extends StatelessWidget {
  final bool disabled;
  final String text;
  final VoidCallback onPressed;
  const BottomNextButton({
    super.key,
    this.text = '다음',
    this.disabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled == false ? onPressed : () {},
      child: Container(
        color: disabled == true
            ? const Color(0xffe3e6eb)
            : const Color(0xff2b2b2b),
        // margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            bottom: 48,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
