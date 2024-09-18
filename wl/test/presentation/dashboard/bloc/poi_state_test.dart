import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/presentation/dashboard/bloc/poi_bloc.dart';

void main() {
  group('PoiState', () {
    test('OnLoadingState supports value comparisons', () {
      expect(OnLoadingState(), OnLoadingState());
    });

    test('OnFailedState supports value comparisons', () {
      expect(const OnFailedState('error'), const OnFailedState('error'));
    });

    test('OnFailedState has correct props', () {
      expect(const OnFailedState('error').props, ['error']);
    });

    test('OnSuccessState supports value comparisons', () {
      expect(
        const OnSuccessState(),
        const OnSuccessState(),
      );
    });

    test('OnSuccessState has correct props', () {
      expect(const OnSuccessState().props, [const Wrapper()]);
    });
  });
}
