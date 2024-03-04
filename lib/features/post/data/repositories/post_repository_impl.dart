import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/network.dart';
import '../../../../core/failures/failures.dart';
import '../../domain/entities/post_entities_export.dart';
import '../../domain/repositories/post_repository.dart';
import '../datasources/post_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostDataSource dataSource;

  final NetworkInfo networkInfo;

  PostRepositoryImpl({
    required this.dataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PostEntity>> exemple() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dataSource.exemple();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
