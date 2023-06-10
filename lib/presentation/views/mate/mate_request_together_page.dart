import 'package:chemiplay/presentation/widgets/app_bar_lead_icon.dart';
import 'package:chemiplay/presentation/widgets/game_cost.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_three_input_button.dart';
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 10),
            MateInformationCard(),
            SizedBox(
              height: 10,
            ),
            GameCard(),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      bottomSheet: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 30,
        ),
        // child: GigiElevatedButton(text: '게임 같이하기'),
        child: GigiElevatedThreeInputButton(
          prefixWidget: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2B2B2B),
            ),
            child: const Center(
              child: Text(
                '1',
                style: TextStyle(
                  color: Color(0xffFF8066),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          widget: const Text(
            '같이 게임하기',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2B2B2B),
            ),
          ),
          suffixWidget: const Text('1100코인',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2B2B2B),
              )),
        ),
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: const Color(0xff4D4D4D),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.77),
                  child: SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset('assets/images/games/img_lol.png')),
                ),
                const SizedBox(width: 10),
                const Text(
                  '리그오브레전드',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '가격',
                  style: TextStyle(color: Color(0xff6E737A)),
                ),
                GameCost(
                  cost: '1100',
                  unit: '판',
                  costStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff262626),
                  ),
                  unitStyle: TextStyle(
                    fontSize: 20,
                    color: Color(0xff6E737A),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '같이 할 횟수',
                  style: TextStyle(color: Color(0xff6E737A)),
                ),
                SizedBox(
                  width: 90,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffCDD3D9),
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        child: const Text(
                          '-',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 30,
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border.symmetric(
                                  horizontal: BorderSide(
                            color: Color(0xffCDD3D9),
                            width: 1,
                          ))),
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: const Text(
                            '1',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffCDD3D9),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: const Text(
                            '+',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MateInformationCard extends StatelessWidget {
  const MateInformationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(
          color: const Color(0xff4D4D4D),
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
            SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  '메이트 닉네임',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_border,
                    ),
                    Text(
                      '5.0',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      '(100+)',
                      style: TextStyle(
                        color: Color(0xff8A9099),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
