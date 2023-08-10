import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:get_it/get_it.dart';

import '../../features/payment/business_logic/cubit/payment_cubit.dart';
import '../../features/payment/data/repository/payment_repository.dart';
import '../../features/profile/business_logic/cubit/profile_cubit.dart';
import '../../features/profile/data/repository/profile_repository.dart';
import '../business_logic/cubit/global_cubit.dart';
import '../../features/auth/business_logic/cubit/auth_cubit.dart';
import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/deals/data/repository/deals_repository.dart';
import '../../features/home/data/repository/home_repository.dart';
import '../../features/menu/data/repository/menu_repository.dart';
import '../../features/search/data/repository/search_repository.dart';

import '../../features/deals/business_logic/cubit/deals_cubit.dart';
import '../../features/home/business_logic/home_cubit.dart';
import '../../features/menu/business_logic/cubit/menu_cubit.dart';
import '../../features/messages/business_logic/cubit/messages_cubit.dart';
import '../../features/notification/business_logic/cubit/notification_cubit.dart';
import '../../features/notification/data/repository/notification_repository.dart';
import '../../features/search/business_logic/cubit/search_cubit.dart';
import '../web_services/token_interceptor.dart';
import '../web_services/web_services.dart';

import 'constants.dart';

final getIt = GetIt.instance;
Dio dio = Dio();
// late CacheStore cacheStore;
// late CacheOptions cacheOptions;
// // late Dio dio;
// late Caller caller;

void initGetIt() {
  // cacheStore = MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576);
  // cacheOptions = CacheOptions(
  //   store: cacheStore,
  //   hitCacheOnErrorExcept: [], // for offline behaviour
  // );
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<AuthRepoistry>(() => AuthRepoistry(getIt()));
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
  getIt.registerLazySingleton<DealsRepository>(() => DealsRepository(getIt()));
  getIt.registerLazySingleton<DealsCubit>(() => DealsCubit(getIt()));

  getIt.registerLazySingleton<MenuRepository>(() => MenuRepository(getIt()));
  getIt.registerLazySingleton<MenuCubit>(() => MenuCubit(getIt()));
  getIt
      .registerLazySingleton<SearchRepository>(() => SearchRepository(getIt()));
  getIt.registerLazySingleton<SearchCubit>(() => SearchCubit(getIt()));
  // getIt.registerLazySingleton<DealsCubit>(() => DealsCubit());
  getIt.registerLazySingleton<MessagesCubit>(() => MessagesCubit());
  getIt.registerLazySingleton<GlobalCubit>(
      () => GlobalCubit(getIt(), getIt(), getIt()));

  getIt.registerLazySingleton<NotificationCubit>(
      () => NotificationCubit(getIt()));
  getIt.registerLazySingleton<NotificationRepository>(
      () => NotificationRepository(getIt()));
  getIt.registerLazySingleton<PaymentCubit>(() => PaymentCubit(getIt()));
  getIt.registerLazySingleton<PaymentRepository>(
      () => PaymentRepository(getIt()));

  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit(getIt()));
  getIt.registerLazySingleton<ProfileRepository>(
      () => ProfileRepository(getIt()));

  // getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  // getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt()));
  // getIt.registerLazySingleton<AuthRepoistry>(() => AuthRepoistry(getIt()));
  // getIt.registerLazySingleton<ProductsCubit>(() => ProductsCubit(getIt()));
  // getIt.registerLazySingleton<ProductsRepository>(
  //     () => ProductsRepository(getIt()));
  // getIt.registerLazySingleton<ForumsCubit>(() => ForumsCubit(getIt()));
  // getIt
  //     .registerLazySingleton<ForumsRepository>(() => ForumsRepository(getIt()));

  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  // log('createAndSetupDiagvghazhgafzaghzfaghzfagzfg $defaultLang');
  // getIt.allowReassignment = true;
  // defaultLang = CacheHelper.getData(key: 'lang')

  dio
    ..options.connectTimeout = const Duration(seconds: 10)
    ..options.receiveTimeout = const Duration(seconds: 10)
    // ..options.baseUrl = AppConstants.baseUrl
    ..options.baseUrl = AppConstants.baseUrl
    ..options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'accept-language': 'ar',
      'Authorization': 'Bearer 123',
    };
  // dio.options.headers.update('accept-language', (value) => defaultLang);

  // log('createAndSetupDio afteeeeeeeeeeeeeeeerb $defaultLang');
  dio.interceptors.add(
    RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 4, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before the first retry
        Duration(seconds: 2), // wait 2 sec before the second retry
        Duration(seconds: 3), // wait 3 sec before the third retry
        Duration(seconds: 4), // wait 4 sec before the fourth retry
      ],
    ),
  );
  // dio.interceptors.add(
  //   TokenIntereceptor(),
  // );

  dio.interceptors.add(TokenIntereceptor());
  dio.interceptors.add(
    LogInterceptor(
      // logPrint: (object) {
      //   print(object);
      // },
      requestBody: true,
      // error: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      request: true,
    ),
  );
  return dio;
}
