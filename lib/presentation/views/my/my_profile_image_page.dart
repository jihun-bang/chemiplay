import 'package:chemiplay/injection.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/presentation/views/my/widgets/my_profile_image.dart';
import 'package:chemiplay/presentation/widgets/gigi_app_bar.dart';
import 'package:chemiplay/utils/logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../signup/profile/widgets/signup_profile_title.dart';

class MyProfileImagePage extends StatefulWidget {
  const MyProfileImagePage({super.key});

  @override
  State<MyProfileImagePage> createState() => _MyProfileImagePageState();
}

class _MyProfileImagePageState extends State<MyProfileImagePage> {
  final _userViewModel = getIt<UserViewModel>();

  Future<bool> _onPickImagePressed() async {
    try {
      final image = await FilePicker.platform
          .pickFiles(allowMultiple: true, type: FileType.image);
      if (image == null) {
        return false;
      }
      final file = await XFile.fromData(image.files.first.bytes!).readAsBytes();
      await _userViewModel.updateProfileImage(file);
      return true;
    } catch (e) {
      Logger.e(e);
      return false;
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _onPickImagePressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GigiAppBar(),
      body: Consumer<UserViewModel>(builder: (context, viewModel, _) {
        if (viewModel.user == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: SignupProfileTitle(
                title: '프로필 사진 수정',
              ),
            ),
            const SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: MyProfileImage(
                  profileImageUrl: viewModel.user!.profileImageUrl,
                  width: 122,
                  height: 122,
                  onTap: () async {
                    await _onPickImagePressed();
                  }),
            ),
          ],
        );
      }),
    );
  }
}
