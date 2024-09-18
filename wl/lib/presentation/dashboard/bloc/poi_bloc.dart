import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.contract.dart';
import 'package:wl/presentation/dashboard/bloc/filter/filter_cubit.dart';

part 'poi_event.dart';
part 'poi_state.dart';

class PoiBloc extends Bloc<PoiEvent, PoiState> {
  PoiBloc({
    required WrapperBlocDataSourceContract wrapperBlocDataSource,
    required FilterCubit filterCubit,
  })  : _wrapperBlocDataSource = wrapperBlocDataSource,
        super(OnLoadingState()) {
    on<OnSuccessEvent>(
      (event, emit) => emit(
        OnSuccessState(wrapper: event.wrapper),
      ),
    );
    on<OnLoadingEvent>((_, emit) => emit(OnLoadingState()));
    on<OnFailureEvent>((event, emit) => emit(OnFailedState(event.error)));

    _filterSubscription = filterCubit.stream.listen(filterPois);
  }

  final WrapperBlocDataSourceContract _wrapperBlocDataSource;
  StreamSubscription<String>? _filterSubscription;

  Future<void> filterPois(String query) async {
    final result = await _wrapperBlocDataSource.fetch();
    if (result.$1 != null) return add(OnFailureEvent(result.$1.toString()));
    if (query.isEmpty) return add(OnSuccessEvent(wrapper: result.$2!));
    final filteredStadiums = result.$2!.stadiums
        .where(
          (stadium) =>
              stadium.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    return add(
      OnSuccessEvent(
        wrapper: result.$2!.copyWith(stadiums: filteredStadiums),
      ),
    );
  }

  Future<void> fetchPois() async {
    final result = await _wrapperBlocDataSource.fetch();
    if (result.$1 != null) return add(OnFailureEvent(result.$1.toString()));
    return add(OnSuccessEvent(wrapper: result.$2!));
  }

  @override
  Future<void> close() {
    _filterSubscription?.cancel();
    return super.close();
  }
}
