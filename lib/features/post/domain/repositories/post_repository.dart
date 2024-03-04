import '../../../../core/annotations/http_annotations.dart';
import '../../../../core/failures/failures.dart';
import '../../domain/entities/post_entities_export.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  @GET(endPoint: 'exemple')
  Future<Either<Failure, PostEntity>> exemple();
}
