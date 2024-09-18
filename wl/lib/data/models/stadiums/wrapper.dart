import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:wl/data/models/stadiums/stadium.dart';

class Wrapper extends Equatable {
  const Wrapper({this.stadiums = const []});

  factory Wrapper.fromMap(Map<String, dynamic> data) => Wrapper(
        stadiums: (data['list'] as List<dynamic>?)
                ?.map((e) => Stadium.fromMap(e as Map<String, dynamic>))
                .toList() ??
            <Stadium>[],
      );

  factory Wrapper.fromJson(String data) =>
      Wrapper.fromMap(json.decode(data) as Map<String, dynamic>);

  final List<Stadium> stadiums;

  String get toJson => json.encode(toMap);

  Map<String, dynamic> get toMap => {
        'list': stadiums.map((e) => e.toMap).toList(),
      };

  @override
  List<Object?> get props => [stadiums];

  @override
  bool get stringify => true;
}
