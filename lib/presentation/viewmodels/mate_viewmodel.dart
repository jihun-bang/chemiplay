import 'package:chemiplay/domain/usecases/mate_usecase.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/user.dart';

class MateViewModel extends ChangeNotifier {
  final MateUseCase _usecase;

  UserModel? _user;
  UserModel? get user => _user;

  MateViewModel(this._usecase);

  Future<void> init(String id) async {
    _user = await _usecase.getUser(id: id);
    notifyListeners();
  }
}
