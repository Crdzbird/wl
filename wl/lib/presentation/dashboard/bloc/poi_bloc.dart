import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.contract.dart';

part 'poi_event.dart';
part 'poi_state.dart';

class PoiBloc extends Bloc<PoiEvent, PoiState> {
  PoiBloc({
    required WrapperBlocDataSourceContract wrapperBlocDataSource,
  })  : _wrapperBlocDataSource = wrapperBlocDataSource,
        super(OnLoadingState()) {
    on<OnSuccessEvent>(
      (event, emit) => emit(
        OnSuccessState(wrapper: event.wrapper),
      ),
    );
    on<OnLoadingEvent>((_, emit) => emit(OnLoadingState()));
    on<OnFailureEvent>((event, emit) => emit(OnFailedState(event.error)));
  }

  final WrapperBlocDataSourceContract _wrapperBlocDataSource;

  Future<void> fetchPois() async {
    final result = await _wrapperBlocDataSource.fetch();
    if (result.$1 != null) return add(OnFailureEvent(result.$1.toString()));
    return add(OnSuccessEvent(wrapper: result.$2!));
  }
}
