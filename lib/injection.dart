import 'package:chemiplay/features/data/repositories/auth_repository.dart';
import 'package:chemiplay/features/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'core/services/auth_service.dart';
import 'features/data/datasources/auth_remote_data_source.dart';
import 'features/domain/usecases/login_usecase.dart';
import 'features/presentation/viewmodels/login_viewmodel.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Services
  getIt.registerSingleton<AuthService>(AuthService());

  // Data Resource
  getIt.registerSingleton<AuthRemoteDataSource>(
      AuthRemoteDataSource(FirebaseAuth.instance));

  // Repository
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(getIt()));

  // Use cases
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt(), getIt()));

  // ViewModels
  getIt.registerSingleton<LoginViewModel>(LoginViewModel(getIt(), getIt()));
}
