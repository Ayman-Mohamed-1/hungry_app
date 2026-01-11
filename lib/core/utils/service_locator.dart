import 'package:get_it/get_it.dart';
import 'package:hungry_app/core/network/apiClient.dart';
import 'package:hungry_app/core/network/apiService.dart';
import 'package:hungry_app/core/network/dioClient.dart';
import 'package:hungry_app/core/utils/storage_helper.dart';
import 'package:hungry_app/features/auth/data/cubit/login_cubit.dart';
import 'package:hungry_app/features/auth/data/repos/AuthRepo.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerLazySingleton<ApiClient>(() => DioClient());

  // Api Service
  sl.registerLazySingleton<ApiService>(() => ApiService(sl<ApiClient>()));

  // storage Helper
  sl.registerLazySingleton(() => SecureStorage());

  // Repos
  sl.registerLazySingleton(() => AuthRepo(sl<ApiService>()));

  // Cubits
  sl.registerFactory(() => LoginCubit(sl<AuthRepo>()));
}
