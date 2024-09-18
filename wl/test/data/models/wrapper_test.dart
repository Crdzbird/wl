import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';

void main() {
  group('Wrapper', () {
    test('should create an empty Wrapper', () {
      const wrapper = Wrapper();
      expect(wrapper.stadiums, isEmpty);
    });

    test('should create a Wrapper from a map', () {
      final map = {
        'list': [
          {'title': 'Stadium 1', 'geocoordinates': 'Location 1'},
          {'title': 'Stadium 2', 'geocoordinates': 'Location 2'},
        ],
      };
      final wrapper = Wrapper.fromMap(map);
      expect(wrapper.stadiums.length, 2);
      expect(wrapper.stadiums[0].title, 'Stadium 1');
      expect(wrapper.stadiums[1].title, 'Stadium 2');
    });

    test('should create a Wrapper from JSON', () {
      const jsonStr =
          // ignore: lines_longer_than_80_chars
          '{"list":[{"title":"Stadium 1","geocoordinates":"Location 1"},{"title":"Stadium 2","geocoordinates":"Location 2"}]}';
      final wrapper = Wrapper.fromJson(jsonStr);
      expect(wrapper.stadiums.length, 2);
      expect(wrapper.stadiums[0].title, 'Stadium 1');
      expect(wrapper.stadiums[1].title, 'Stadium 2');
    });

    test('should convert a Wrapper to JSON', () {
      final stadiums = [
        const Stadium(title: 'Stadium 1', geocoordinates: 'Location 1'),
        const Stadium(title: 'Stadium 2', geocoordinates: 'Location 2'),
      ];
      final wrapper = Wrapper(stadiums: stadiums);
      final jsonStr = wrapper.toJson;
      expect(
        jsonStr,
        // ignore: lines_longer_than_80_chars
        '{"list":[{"id":"","title":"Stadium 1","geocoordinates":"Location 1","image":""},{"id":"","title":"Stadium 2","geocoordinates":"Location 2","image":""}]}',
      );
    });

    test('should convert a Wrapper to a map', () {
      final stadiums = [
        const Stadium(title: 'Stadium 1', geocoordinates: 'Location 1'),
        const Stadium(title: 'Stadium 2', geocoordinates: 'Location 2'),
      ];
      final wrapper = Wrapper(stadiums: stadiums);
      final map = wrapper.toMap;
      expect(map, {
        'list': [
          {
            'id': '',
            'title': 'Stadium 1',
            'geocoordinates': 'Location 1',
            'image': '',
          },
          {
            'id': '',
            'title': 'Stadium 2',
            'geocoordinates': 'Location 2',
            'image': '',
          },
        ],
      });
    });

    test('should copy a Wrapper with new values', () {
      final stadiums = [
        const Stadium(title: 'Stadium 1', geocoordinates: 'Location 1'),
      ];
      final wrapper = Wrapper(stadiums: stadiums);
      final newStadiums = [
        const Stadium(title: 'Stadium 2', geocoordinates: 'Location 2'),
      ];
      final newWrapper = wrapper.copyWith(stadiums: newStadiums);
      expect(newWrapper.stadiums, newStadiums);
    });

    test('should equate two identical Wrappers', () {
      final stadiums = [
        const Stadium(title: 'Stadium 1', geocoordinates: 'Location 1'),
      ];
      final wrapper1 = Wrapper(stadiums: stadiums);
      final wrapper2 = Wrapper(stadiums: stadiums);
      expect(wrapper1, wrapper2);
    });
  });
}
