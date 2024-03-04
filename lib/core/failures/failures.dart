abstract class Failure {
  final String? msg;
  Failure({this.msg});
}

class ServerFailure extends Failure {
  ServerFailure({super.msg});
}

class OfflineFailure extends Failure {
  OfflineFailure({super.msg});
}
