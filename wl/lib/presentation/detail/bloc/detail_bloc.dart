import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.contract.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({
    required WrapperBlocDataSourceContract wrapperBlocDataSource,
  })  : _wrapperBlocDataSource = wrapperBlocDataSource,
        super(OnLoadingState()) {
    on<OnSuccessEvent>(
      (event, emit) => emit(
        OnSuccessState(stadium: event.stadium),
      ),
    );
    on<OnLoadingEvent>((_, emit) => emit(OnLoadingState()));
    on<OnFailureEvent>((event, emit) => emit(OnFailedState(event.error)));
  }

  final WrapperBlocDataSourceContract _wrapperBlocDataSource;

  Future<void> fetchStadium(String id) async {
    final result = _wrapperBlocDataSource.stadium(id);
    if (result.id.isNotEmpty) return add(OnSuccessEvent(stadium: result));
    return add(const OnFailureEvent('Stadium not found'));
  }
}
