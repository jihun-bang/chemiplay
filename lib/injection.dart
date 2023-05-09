import 'package:chemiplay/features/data/datasources/sendbird_data_source.dart';
import 'package:chemiplay/features/data/repositories/auth_repository.dart';
import 'package:chemiplay/features/data/repositories/sendbird_auth_repository.dart';
import 'package:chemiplay/features/data/repositories/sendbird_message_repository.dart';
import 'package:chemiplay/features/domain/repositories/auth_repository.dart';
import 'package:chemiplay/features/domain/repositories/sendbird_auth_repository.dart';
import 'package:chemiplay/features/domain/usecases/sendbird_usecase.dart';
import 'package:chemiplay/features/presentation/viewmodels/chat_viewmodel.dart';
import 'package:chemiplay/features/presentation/viewmodels/user_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

import 'core/services/auth_service.dart';
import 'features/data/datasources/auth_remote_data_source.dart';
import 'features/domain/repositories/sendbird_message_repository.dart';
import 'features/domain/usecases/login_usecase.dart';
import 'features/presentation/viewmodels/login_viewmodel.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<SendbirdSdk>(
      SendbirdSdk(appId: '2EDF7F38-549C-43C7-9688-164126406A08'));

  // Services
  getIt.registerSingleton<AuthService>(AuthService());

  // Data Resource
  getIt.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(FirebaseAuth.instance));
  getIt.registerSingleton<SendbirdDataSource>(SendbirdDataSource(getIt()));

  // Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt()));
  getIt.registerSingleton<SendbirdAuthRepository>(
      SendbirdAuthRepositoryImpl(getIt()));
  getIt.registerSingleton<SendbirdMessageRepository>(
      SendbirdMessageRepositoryImpl(getIt()));

  // Use cases
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt(), getIt()));
  getIt.registerSingleton<SendbirdUseCase>(SendbirdUseCase(getIt(), getIt()));

  // ViewModels
  getIt.registerSingleton<LoginViewModel>(LoginViewModel(getIt()));
  getIt.registerSingleton<UserViewModel>(UserViewModel(getIt()));
  getIt.registerSingleton<ChatViewModel>(ChatViewModel(getIt()));
}
