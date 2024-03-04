// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/post/data/datasources/post_data_source.dart' as _i5;
import '../../features/post/data/repositories/post_repository_impl.dart' as _i7;
import '../../features/post/domain/repositories/post_repository.dart' as _i6;
import '../../features/post/domain/usecases/exemple_usecase.dart' as _i8;
import '../../features/post/presentation/blocs/exemple/exemple_bloc.dart'
    as _i9;
import '../network/http_client.dart' as _i10;
import '../network/network.dart' as _i4;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final httpClientModule = _$HttpClientModule();
  gh.lazySingleton<_i3.Client>(() => httpClientModule.httpClient);
  gh.factory<_i4.ConnectivityModule>(() => _i4.ConnectivityModule());
  gh.lazySingleton<_i4.NetworkInfo>(() =>
      _i4.NetworkInfoImpl(connectivityResult: gh<_i4.ConnectivityModule>()));
  gh.lazySingleton<_i5.PostDataSource>(
      () => _i5.PostDataSourceImpl(client: gh<_i3.Client>()));
  gh.lazySingleton<_i6.PostRepository>(() => _i7.PostRepositoryImpl(
        dataSource: gh<_i5.PostDataSource>(),
        networkInfo: gh<_i4.NetworkInfo>(),
      ));
  gh.lazySingleton<_i8.ExempleUseCase>(
      () => _i8.ExempleUseCase(gh<_i6.PostRepository>()));
  gh.factory<_i9.ExempleBloc>(
      () => _i9.ExempleBloc(exempleUseCase: gh<_i8.ExempleUseCase>()));
  return getIt;
}

class _$HttpClientModule extends _i10.HttpClientModule {}
