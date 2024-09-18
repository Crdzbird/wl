import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/models/stadiums/stadium.dart';

void main() {
  group('Stadium', () {
    const stadium = Stadium(
      id: '1',
      title: 'Stadium Title',
      geocoordinates: '123,456',
      image: 'image_url',
    );

    test('supports value comparison', () {
      expect(
        stadium,
        const Stadium(
          id: '1',
          title: 'Stadium Title',
          geocoordinates: '123,456',
          image: 'image_url',
        ),
      );
    });

    test('fromMap creates a Stadium from a map', () {
      final map = {
        'id': '1',
        'title': 'Stadium Title',
        'geocoordinates': '123,456',
        'image': 'image_url',
      };
      expect(Stadium.fromMap(map), stadium);
    });

    test('toMap converts a Stadium to a map', () {
      final map = {
        'id': '1',
        'title': 'Stadium Title',
        'geocoordinates': '123,456',
        'image': 'image_url',
      };
      expect(stadium.toMap, map);
    });

    test('fromJson creates a Stadium from a JSON string', () {
      const jsonStr =
          // ignore: lines_longer_than_80_chars
          '{"id":"1","title":"Stadium Title","geocoordinates":"123,456","image":"image_url"}';
      expect(Stadium.fromJson(jsonStr), stadium);
    });

    test('toJson converts a Stadium to a JSON string', () {
      const jsonStr =
          // ignore: lines_longer_than_80_chars
          '{"id":"1","title":"Stadium Title","geocoordinates":"123,456","image":"image_url"}';
      expect(stadium.toJson, jsonStr);
    });

    test('copyWith creates a copy with updated values', () {
      final updatedStadium = stadium.copyWith(title: 'New Title');
      expect(updatedStadium.title, 'New Title');
      expect(updatedStadium.id, stadium.id);
    });
  });
}
