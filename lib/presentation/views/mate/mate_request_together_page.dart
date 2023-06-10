import 'package:chemiplay/presentation/widgets/app_bar_lead_icon.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:flutter/material.dart';

class MateRequestTogetherPage extends StatefulWidget {
  const MateRequestTogetherPage({super.key});

  @override
  State<MateRequestTogetherPage> createState() =>
      _MateRequestTogetherPageState();
}

class _MateRequestTogetherPageState extends State<MateRequestTogetherPage> {
  final Color backgroundColor = const Color(0xffF5F7FA);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GigiAppBar(
        title: '같이하기',
        leading: AppBarLeadIcon(context: context),
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xff2b2b2b),
                width: 1,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Row(
                children: [
                  CircleAvatar(),
                  Column(
                    children: [
                      Text('메이트 닉네임'),
                      Row(
                        children: [
                          Icon(
                            Icons.star_border,
                          ),
                          Text('5.0'),
                          Text(
                            '(100+)',
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
      backgroundColor: backgroundColor,
    );
  }
}
