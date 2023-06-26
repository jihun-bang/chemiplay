import 'package:flutter/material.dart';

class GigiAlertDialog extends StatelessWidget {
  final String? title;
  final String? description;
  final List<Widget> actions;
  const GigiAlertDialog({
    super.key,
    this.title,
    this.description,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    double paddingValue;
    if (deviceWidth < 360) {
      // 가장 작은 모바일 디바이스
      paddingValue = 10;
    } else if (deviceWidth < 600) {
      // 중간 크기의 모바일 디바이스
      paddingValue = 20;
    } else {
      // 대형 디바이스 (PC, 태블릿 등)
      paddingValue = 40;
    }
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null) ...[
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                  if (description != null) ...[
                    Text(
                      description!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    for (var action in actions) ...[
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: action,
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
