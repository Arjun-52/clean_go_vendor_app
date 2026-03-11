import 'package:get_it/get_it.dart';
import 'package:clean_go_vendor_app/core/network/api_service.dart';
import 'package:clean_go_vendor_app/features/orders/domain/repositories/i_order_repository.dart';
import 'package:clean_go_vendor_app/features/orders/data/repositories/order_repository_impl.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // 1. Core Services
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // 2. Storage Services (Placeholder for future flutter_secure_storage)
  // getIt.registerLazySingleton<StorageService>(() => StorageService());

  // 3. Repositories
  getIt.registerLazySingleton<IOrderRepository>(
    () => OrderRepositoryImpl(),
  );
}
