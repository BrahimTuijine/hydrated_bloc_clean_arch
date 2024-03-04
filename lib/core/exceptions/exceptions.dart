class ServerException implements Exception {
  final String? msg;

  ServerException({this.msg});
}

class OfflineException implements Exception {
  final String? msg;

  OfflineException({this.msg});
}
