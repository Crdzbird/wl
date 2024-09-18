import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/presentation/dashboard/bloc/poi_bloc.dart';

void main() {
  group('PoiEvent', () {
    test('OnSuccessEvent props', () {
      const wrapper = Wrapper();
      const event = OnSuccessEvent(wrapper: wrapper);
      expect(event.props, [wrapper]);
    });

    test('OnFailureEvent props', () {
      const error = 'An error occurred';
      const event = OnFailureEvent(error);
      expect(event.props, [error]);
    });

    test('OnLoadingEvent props', () {
      const event = OnLoadingEvent();
      expect(event.props, isEmpty);
    });

    test('OnSuccessEvent equality', () {
      const wrapper1 = Wrapper();
      const wrapper2 = Wrapper();
      const event1 = OnSuccessEvent(wrapper: wrapper1);
      const event2 = OnSuccessEvent(wrapper: wrapper1);
      const event3 = OnSuccessEvent(wrapper: wrapper2);

      expect(event1, event2);
      expect(event1, equals(event3));
    });

    test('OnFailureEvent equality', () {
      const error1 = 'Error 1';
      const error2 = 'Error 2';
      const event1 = OnFailureEvent(error1);
      const event2 = OnFailureEvent(error1);
      const event3 = OnFailureEvent(error2);

      expect(event1, event2);
      expect(event1, isNot(event3));
    });

    test('OnLoadingEvent equality', () {
      const event1 = OnLoadingEvent();
      const event2 = OnLoadingEvent();

      expect(event1, event2);
    });
  });
}
