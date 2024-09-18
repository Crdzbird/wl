import 'dart:convert';

import 'package:equatable/equatable.dart';

class Stadium extends Equatable {
  const Stadium({
    this.id = '',
    this.title = '',
    this.geocoordinates = '',
    this.image = '',
  });

  factory Stadium.fromMap(Map<String, dynamic> data) => Stadium(
        id: data['id'] as String? ?? '',
        title: data['title'] as String? ?? '',
        geocoordinates: data['geocoordinates'] as String? ?? '',
        image: data['image'] as String? ?? '',
      );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [List].
  factory Stadium.fromJson(String data) {
    if (data.isEmpty) return const Stadium();
    return Stadium.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  final String id;
  final String title;
  final String geocoordinates;
  final String image;

  Map<String, dynamic> get toMap => {
        'id': id,
        'title': title,
        'geocoordinates': geocoordinates,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Converts [List] to a JSON string.
  String get toJson => json.encode(toMap);

  Stadium copyWith({
    String? id,
    String? title,
    String? geocoordinates,
    String? image,
  }) {
    return Stadium(
      id: id ?? this.id,
      title: title ?? this.title,
      geocoordinates: geocoordinates ?? this.geocoordinates,
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, title, geocoordinates, image];
}
