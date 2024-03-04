import 'dart:convert';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/post_entities_export.dart';
import 'package:injectable/injectable.dart';

abstract class PostDataSource {
  Future<PostEntity> exemple();
}

@LazySingleton(as: PostDataSource)
class PostDataSourceImpl implements PostDataSource {
  final http.Client client;

  PostDataSourceImpl({required this.client});

  final headers = <String, String>{
    "Content-Type": "application/json",
    "Accept": "application/json"
  };

  @override
  Future<PostEntity> exemple() async {
    final response = await client
        .get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
          headers: headers,
        )
        .onError((error, stackTrace) => throw ServerException());

    if ([200, 201].contains(response.statusCode)) {
      return compute(PostEntity.fromJson,
          json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw ServerException();
    }
  }
}
