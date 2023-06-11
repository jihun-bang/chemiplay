import 'package:chemiplay/data/models/user.dart';
import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/mate_together_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/mate_viewmodel.dart';
import 'package:chemiplay/presentation/widgets/app_bar_lead_icon.dart';
import 'package:chemiplay/presentation/widgets/game_cost.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/presentation/widgets/gigi_elevated_three_input_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class MateRequestTogetherPage extends StatefulWidget {
  final String mateId = 'F5s7bETsxIfQImOfPvE5OcCXuts2';
  const MateRequestTogetherPage({super.key});

  @override
  State<MateRequestTogetherPage> createState() =>
      _MateRequestTogetherPageState();
}

class _MateRequestTogetherPageState extends State<MateRequestTogetherPage> {
  final Color backgroundColor = const Color(0xffF5F7FA);
  final _mateViewModel = getIt<MateViewModel>();
  MateTogetherViewModel _mateTogetherViewModel = getIt<MateTogetherViewModel>();

  @override
  void initState() {
    super.initState();
    _mateTogetherViewModel.init(
      costPerMatch: 1100,
    );
  }

  Future initMateState() async {
    await _mateViewModel.init(widget.mateId);
    return _mateViewModel.user!;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MateTogetherViewModel>(
      create: (context) => _mateTogetherViewModel,
      child: Consumer<MateTogetherViewModel>(builder: (context, viewModel, _) {
        _mateTogetherViewModel = viewModel;
        return Scaffold(
          appBar: GigiAppBar(
            title: '같이하기',
            leading: AppBarLeadIcon(context: context),
            backgroundColor: backgroundColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: FutureBuilder(
                future: initMateState(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return MateRequestTogeterContent(
                      mateTogetherViewModel: _mateTogetherViewModel,
                      mateUser: snapshot.data,
                    );
                  } else if (snapshot.hasError) {
                    return const SizedBox();
                  } else {
                    return const Center(child: Text('loading'));
                  }
                }),
          ),
          backgroundColor: backgroundColor,
          bottomSheet: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 30,
            ),
            child: GigiElevatedThreeInputButton(
              prefixWidget: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff2B2B2B),
                ),
                child: Center(
                  child: Text(
                    _mateTogetherViewModel.theNumberOfTime.toString(),
                    style: const TextStyle(
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
              suffixWidget: Text(
                "${_mateTogetherViewModel.costPerMatch * _mateTogetherViewModel.theNumberOfTime}코인",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF2B2B2B),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class MateRequestTogeterContent extends StatelessWidget {
  const MateRequestTogeterContent({
    super.key,
    required MateTogetherViewModel mateTogetherViewModel,
    required this.mateUser,
  }) : _mateTogetherViewModel = mateTogetherViewModel;

  final MateTogetherViewModel _mateTogetherViewModel;
  final UserModel mateUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        MateInformationCard(
          mateUser: mateUser,
        ),
        const SizedBox(
          height: 10,
        ),
        GameCard(
          costPerMatch: _mateTogetherViewModel.costPerMatch,
          theNumberOfTime: _mateTogetherViewModel.theNumberOfTime,
          increseTime: _mateTogetherViewModel.increseTime,
          decreseTime: _mateTogetherViewModel.decreseTime,
          isMinimumTime: _mateTogetherViewModel.isMinimumTime,
          isMaximumTime: _mateTogetherViewModel.isMaximumTime,
        ),
      ],
    );
  }
}

class GameCard extends StatelessWidget {
  final int costPerMatch;
  final int theNumberOfTime;
  final VoidCallback increseTime;
  final VoidCallback decreseTime;
  final bool isMinimumTime;
  final bool isMaximumTime;
  const GameCard({
    super.key,
    required this.costPerMatch,
    required this.theNumberOfTime,
    required this.increseTime,
    required this.decreseTime,
    required this.isMinimumTime,
    required this.isMaximumTime,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  '가격',
                  style: TextStyle(color: Color(0xff6E737A)),
                ),
                GameCost(
                  cost: costPerMatch.toString(),
                  unit: '판',
                  costStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff262626),
                  ),
                  unitStyle: const TextStyle(
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
                      GestureDetector(
                        onTap: decreseTime,
                        child: Container(
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
                          child: Text(
                            '-',
                            style: TextStyle(
                                fontSize: 20,
                                color: !isMinimumTime
                                    ? Colors.black
                                    : const Color(0xffCDD3D9)),
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
                          child: Text(
                            theNumberOfTime.toString(),
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: increseTime,
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
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: !isMaximumTime
                                      ? Colors.black
                                      : const Color(0xffCDD3D9)),
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
    required this.mateUser,
  });
  final UserModel mateUser;

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
          vertical: 12,
          horizontal: 20,
        ),
        child: Row(
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(mateUser.profileImageUrl!),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              children: [
                Text(
                  mateUser.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/icon_star.svg'),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      '5.0',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
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
