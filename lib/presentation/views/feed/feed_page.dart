import 'package:flutter/material.dart';

import '../../widgets/gigi_app_bar.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: const GigiAppBar(title: '피드', titleAlign: Alignment.centerLeft),
      body: ListView(
        children: [],
      ),
    );
  }
}
