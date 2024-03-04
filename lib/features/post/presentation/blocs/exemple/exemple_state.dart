part of 'exemple_bloc.dart';

class ExempleState {
  const ExempleState();
}

class ExempleInitial extends ExempleState {
  const ExempleInitial();
}

class ExempleLoading extends ExempleState {
  const ExempleLoading();
}

class ExempleLoaded extends ExempleState {
  final PostEntity result;

  const ExempleLoaded({required this.result});
}

class ExempleError extends ExempleState {
  final String message;

  const ExempleError({required this.message});
}
