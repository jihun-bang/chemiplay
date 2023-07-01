import 'package:chemiplay/data/repositories/auth_repository_impl.dart';
import 'package:chemiplay/data/repositories/sendbird_auth_repository_impl.dart';
import 'package:chemiplay/data/repositories/sendbird_message_repository_impl.dart';
import 'package:chemiplay/domain/usecases/mate_usecase.dart';
import 'package:chemiplay/presentation/viewmodels/chat_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/login_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/mate_together_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/mate_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/my_mate_profile_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/signup_profile_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/timer_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/user_viewmodel.dart';
import 'package:chemiplay/presentation/viewmodels/verify_phone_number_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

import 'data/network/datasources/auth_remote_data_source.dart';
import 'data/network/datasources/firebase_database.dart';
import 'data/network/datasources/sendbird_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/repositories/sendbird_auth_repository.dart';
import 'domain/repositories/sendbird_message_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'domain/usecases/sendbird_usecase.dart';
import 'domain/usecases/user_usecase.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<SendbirdSdk>(
      SendbirdSdk(appId: '8C610B6C-31CE-4E27-994F-C8C76DF0D188'));

  // Data Resource
  getIt.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(FirebaseAuth.instance));
  getIt.registerSingleton<SendbirdDataSource>(SendbirdDataSource(getIt()));
  getIt.registerSingleton<FirebaseDatabase>(FirebaseDatabase());

  // Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt()));
  getIt.registerSingleton<SendbirdAuthRepository>(
      SendbirdAuthRepositoryImpl(getIt()));
  getIt.registerSingleton<SendbirdMessageRepository>(
      SendbirdMessageRepositoryImpl());
  getIt.registerFactory<UserRepository>(() => UserRepositoryImpl(getIt()));

  // Usecases
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt(), getIt()));
  getIt.registerFactory<SendbirdUseCase>(
      () => SendbirdUseCase(getIt(), getIt()));
  getIt.registerFactory<UserUseCase>(() => UserUseCase(getIt()));
  getIt.registerFactory<MateUseCase>(() => MateUseCase(getIt()));

  // ViewModels
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt()));
  getIt.registerSingleton<UserViewModel>(UserViewModel(getIt()));
  getIt.registerSingleton<ChatViewModel>(ChatViewModel(getIt()));
  getIt.registerFactory<MateViewModel>(() => MateViewModel(getIt()));
  getIt.registerFactory<MateTogetherViewModel>(() => MateTogetherViewModel());
  getIt.registerFactory<TimerViewModel>(() => TimerViewModel());
  getIt.registerSingleton<SignupProfileViewModel>(
      SignupProfileViewModel(getIt(), getIt()));
  getIt.registerFactory<MyMateProfileViewModel>(
      () => MyMateProfileViewModel(getIt()));
  getIt.registerSingleton<VerifyPhoneNumberViewModel>(
      VerifyPhoneNumberViewModel(getIt()));
}
