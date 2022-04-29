import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_case_smena/core/repos/menu_repository.dart';

import '../../models/category.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final MenuRepository _repository;
  AppBloc(this._repository) : super(const AppState.initial()) {
    on<AppEvent>((event, emit) {
      event.map(dataRequested: (_) async {
        final res = await _repository.getMenu();
         // emit(AppState.loadSuccessful([]));
      });
    });
  }
}
