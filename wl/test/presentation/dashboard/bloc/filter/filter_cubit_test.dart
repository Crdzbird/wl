import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wl/presentation/dashboard/bloc/filter/filter_cubit.dart';

void main() {
  group('FilterCubit', () {
    late FilterCubit filterCubit;

    setUp(() {
      filterCubit = FilterCubit();
    });

    tearDown(() {
      filterCubit.close();
    });

    test('initial state is an empty string', () {
      expect(filterCubit.state, '');
    });

    blocTest<FilterCubit, String>(
      'emits new query when onChangeQuery is called',
      build: () => filterCubit,
      act: (cubit) => cubit.onChangeQuery('new query'),
      expect: () => ['new query'],
    );

    blocTest<FilterCubit, String>(
      'emits empty string when onChangeQuery is called with null',
      build: () => filterCubit,
      act: (cubit) => cubit.onChangeQuery(null),
      expect: () => [''],
    );

    test('query getter returns the current state', () {
      filterCubit.onChangeQuery('test query');
      expect(filterCubit.query, 'test query');
    });
  });
}
