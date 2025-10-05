import 'package:wedding_invitation_app/core/services/navigation_service.dart';
import 'package:wedding_invitation_app/core/services/wedding_data_service.dart';
import 'package:wedding_invitation_app/core/services/gallery_service.dart';
import 'package:wedding_invitation_app/core/services/message_service.dart';
import 'package:wedding_invitation_app/features/wedding/domain/repositories/wedding_repository.dart';
import 'package:wedding_invitation_app/features/wedding/domain/usecases/get_wedding_info_usecase.dart';
import 'package:wedding_invitation_app/features/wedding/data/repositories/wedding_repository_impl.dart';
import 'package:wedding_invitation_app/features/wedding/data/datasources/wedding_local_datasource.dart';

/// Dependency Injection Container
/// Manages all app dependencies using a simple service locator pattern
class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  final Map<Type, dynamic> _services = <Type, dynamic>{};

  /// Register a service instance
  void registerSingleton<T>(T service) {
    _services[T] = service;
  }

  /// Register a factory function for lazy initialization
  void registerFactory<T>(T Function() factory) {
    _services[T] = factory;
  }

  /// Get a service instance
  T get<T>() {
    final service = _services[T];
    if (service == null) {
      throw Exception('Service of type $T is not registered');
    }

    if (service is Function) {
      return service() as T;
    }

    return service as T;
  }

  /// Check if a service is registered
  bool isRegistered<T>() {
    return _services.containsKey(T);
  }

  /// Remove a service
  void unregister<T>() {
    _services.remove(T);
  }

  /// Clear all services
  void clear() {
    _services.clear();
  }

  /// Initialize all dependencies
  Future<void> setupDependencies() async {
    // Core services
    registerSingleton<NavigationService>(NavigationService());
    registerSingleton<WeddingDataService>(WeddingDataService());
    registerSingleton<GalleryService>(GalleryService());
    registerSingleton<MessageService>(MessageService());

    // Data sources
    registerSingleton<WeddingLocalDataSource>(WeddingLocalDataSourceImpl());

    // Repositories
    registerSingleton<WeddingRepository>(
      WeddingRepositoryImpl(localDataSource: get<WeddingLocalDataSource>()),
    );

    // Use cases
    registerSingleton<GetWeddingInfoUseCase>(
      GetWeddingInfoUseCase(repository: get<WeddingRepository>()),
    );
  }
}

/// Global service locator instance
final ServiceLocator sl = ServiceLocator();
