import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/exemple_usecase.dart';
import '../../../../../core/failureToMessage/map_failure_to_message.dart';
import '../../../domain/entities/post_entities_export.dart';

part 'exemple_event.dart';
part 'exemple_state.dart';

@injectable
class ExempleBloc extends HydratedBloc<ExempleEvent, ExempleState> {
  final ExempleUseCase exempleUseCase;

  ExempleBloc({required this.exempleUseCase}) : super(const ExempleInitial()) {
    on<ExempleEvent>((event, emit) async {
      emit(const ExempleLoading());

      final result = await exempleUseCase();

      result.fold((failure) {
        emit(ExempleError(message: mapFailureToMessage(failure)));
      }, (result) {
        emit(ExempleLoaded(result: result));
      });
    });
  }

  @override
  ExempleState? fromJson(Map<String, dynamic> json) => ExempleLoaded(
        result: PostEntity.fromJson(json),
      );

  @override
  Map<String, dynamic>? toJson(ExempleState state) {
    if (state is ExempleLoaded) {
      return state.result.toJson();
    }
    return null;
  }
}
