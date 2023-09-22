
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yawar_test/features/Posts/presentation/cubit/posts_cubit.dart';
import 'package:yawar_test/features/Posts/presentation/cubit/upload_cubit.dart';
import 'Core/Api/api_consumer.dart';
import 'Core/Api/dio_consumer.dart';
import 'Core/Api/dio_interceptor.dart';
import 'Core/network/network_info.dart';
import 'features/Posts/data/datasources/post_remote_datasource.dart';
import 'features/Posts/data/repositories/posts_repository_imp.dart';
import 'features/Posts/domain/repositories/posts_repository.dart';
import 'features/Posts/domain/usecases/add_post_usecase.dart';
import 'features/Posts/domain/usecases/get_all_posts_usecase.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Bloc

  sl.registerFactory(() => PostsCubit(
      getAllPostsUsecase: sl()
      ));
  sl.registerFactory(() => UploadCubit(
      addPostUsecase: sl()
      ));
 

  // Use cases
  sl.registerLazySingleton(() => GetAllPostsUsecase(postsRepository: sl()));
  sl.registerLazySingleton(() => AddPostUsecase(postsRepository: sl()));
 

  // Repository
  sl.registerLazySingleton<PostsRepository>(
    () =>PostsRepositoryImp(networkInfo: sl(), postRemoteDataSource: sl()));
 
  // Data sources

  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImp(apiConsumer: sl()),
  );
 

  //! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
