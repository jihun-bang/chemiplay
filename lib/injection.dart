import 'package:chemiplay/features/data/datasources/firebase_database.dart';
import 'package:chemiplay/features/data/datasources/sendbird_data_source.dart';
import 'package:chemiplay/features/data/repositories/auth_repository_impl.dart';
import 'package:chemiplay/features/data/repositories/sendbird_auth_repository_impl.dart';
import 'package:chemiplay/features/data/repositories/sendbird_message_repository_impl.dart';
import 'package:chemiplay/features/domain/repositories/auth_repository.dart';
import 'package:chemiplay/features/domain/repositories/sendbird_auth_repository.dart';
import 'package:chemiplay/features/domain/repositories/user_repository.dart';
import 'package:chemiplay/features/domain/usecases/sendbird_usecase.dart';
import 'package:chemiplay/features/domain/usecases/user_usecase.dart';
import 'package:chemiplay/features/presentation/viewmodels/chat_viewmodel.dart';
import 'package:chemiplay/features/presentation/viewmodels/user_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:sendbird_sdk/sdk/sendbird_sdk_api.dart';

import 'features/data/datasources/auth_remote_data_source.dart';
import 'features/data/repositories/user_repository_impl.dart';
import 'features/domain/repositories/sendbird_message_repository.dart';
import 'features/domain/usecases/login_usecase.dart';
import 'features/presentation/viewmodels/login_viewmodel.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton<SendbirdSdk>(
      SendbirdSdk(appId: '2EDF7F38-549C-43C7-9688-164126406A08'));

  // Data Resource
  getIt.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(FirebaseAuth.instance));
  getIt.registerSingleton<SendbirdDataSource>(SendbirdDataSource(getIt()));
  getIt.registerSingleton<FirebaseDatabase>(
      FirebaseDatabase(FirebaseFirestore.instance));

  // Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt()));
  getIt.registerSingleton<SendbirdAuthRepository>(
      SendbirdAuthRepositoryImpl(getIt()));
  getIt.registerSingleton<SendbirdMessageRepository>(
      SendbirdMessageRepositoryImpl(getIt()));
  getIt.registerFactory<UserRepository>(() => UserRepositoryImpl(getIt()));

  // Usecases
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt(), getIt()));
  getIt.registerFactory<SendbirdUseCase>(
      () => SendbirdUseCase(getIt(), getIt()));
  getIt.registerFactory<UserUseCase>(() => UserUseCase(getIt()));

  // ViewModels
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(getIt()));
  getIt.registerSingleton<UserViewModel>(UserViewModel(getIt()));
  getIt.registerSingleton<ChatViewModel>(ChatViewModel(getIt()));
}
