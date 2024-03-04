import '../constants/app_const.dart';
import '../failures/failures.dart';

String mapFailureToMessage(failure) {
  return switch (failure.runtimeType) {
    OfflineFailure => AppConst.offLineFailureMessage,
    ServerFailure => AppConst.serverFailureMessage,
    _ => AppConst.unexpectedErrorMessage,
  };
}
