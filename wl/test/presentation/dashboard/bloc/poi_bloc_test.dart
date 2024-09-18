import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.contract.dart';
import 'package:wl/presentation/dashboard/bloc/filter/filter_cubit.dart';
import 'package:wl/presentation/dashboard/bloc/poi_bloc.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  late WrapperBlocDataSourceContract mockWrapperBlocDataSource;
  late FilterCubit mockFilterCubit;
  late PoiBloc poiBloc;

  setUp(() {
    mockWrapperBlocDataSource = MockWrapperBlocDataSource();
    mockFilterCubit = MockFilterCubit();
    poiBloc = PoiBloc(
      wrapperBlocDataSource: mockWrapperBlocDataSource,
      filterCubit: mockFilterCubit,
    );
  });

  tearDown(() {
    poiBloc.close();
  });

  group('PoiBloc', () {
    test('initial state is OnLoadingState', () {
      expect(poiBloc.state, OnLoadingState());
    });

    blocTest<PoiBloc, PoiState>(
      'emits [OnSuccessState] when fetchPois is successful',
      build: () {
        when(mockWrapperBlocDataSource.fetch()).thenAnswer(
          (_) async => (null, const Wrapper()),
        );
        return poiBloc;
      },
      act: (bloc) => bloc.fetchPois(),
      expect: () => [
        const OnSuccessState(),
      ],
    );

    blocTest<PoiBloc, PoiState>(
      'emits [OnLoadingState, OnFailedState] when fetchPois fails',
      build: () {
        when(mockWrapperBlocDataSource.fetch()).thenAnswer(
          (_) async => (CacheFailure(errorMessage: 'Error'), null),
        );
        return poiBloc;
      },
      act: (bloc) => bloc.fetchPois(),
      expect: () => [
        const OnFailedState('CacheFailure(Error)'),
      ],
    );

    blocTest<PoiBloc, PoiState>(
      'emits [OnSuccessState] when filterPois is successful with empty query',
      build: () {
        when(mockWrapperBlocDataSource.fetch()).thenAnswer(
          (_) async => (null, const Wrapper()),
        );
        return poiBloc;
      },
      act: (bloc) => bloc.filterPois(''),
      expect: () => [
        const OnSuccessState(),
      ],
    );

    blocTest<PoiBloc, PoiState>(
      'emits [OnSuccessState] when filterPois is successful w. non-empty query',
      build: () {
        when(mockWrapperBlocDataSource.fetch()).thenAnswer(
          (_) async =>
              (null, const Wrapper(stadiums: [Stadium(title: 'Test Stadium')])),
        );
        return poiBloc;
      },
      act: (bloc) => bloc.filterPois('test'),
      expect: () => [
        const OnSuccessState(
          wrapper: Wrapper(stadiums: [Stadium(title: 'Test Stadium')]),
        ),
      ],
    );

    blocTest<PoiBloc, PoiState>(
      'emits [OnFailedState] when filterPois fails',
      build: () {
        when(mockWrapperBlocDataSource.fetch()).thenAnswer(
          (_) async => (CacheFailure(errorMessage: 'Error'), null),
        );
        return poiBloc;
      },
      act: (bloc) => bloc.filterPois('test'),
      expect: () => [
        const OnFailedState('CacheFailure(Error)'),
      ],
    );
  });
}
