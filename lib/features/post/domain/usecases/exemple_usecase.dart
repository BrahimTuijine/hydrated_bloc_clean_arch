import '../../../../core/failures/failures.dart';
import '../../domain/entities/post_entities_export.dart';
import '../repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExempleUseCase {
  final PostRepository repository;
  ExempleUseCase(this.repository);

  Future<Either<Failure, PostEntity>> call() async {
    return await repository.exemple();
  }
}
