import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/enums/preferences.enum.dart';
import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/domain/datasource/local/wrapper.datasource.contract.dart';

class WrapperDataSource extends WrapperDataSourceContract {
  WrapperDataSource(PreferencesDataSourceContract preferences)
      : _preferences = preferences;

  final PreferencesDataSourceContract _preferences;
  @override
  (Failure?, Wrapper?) get() {
    try {
      final wrapperJson =
          _preferences.read<String>(key: PreferencesEnum.pois.cachedName) ?? '';
      if (wrapperJson.isEmpty) return (null, const Wrapper());
      return (null, Wrapper.fromJson(wrapperJson));
    } catch (e) {
      return (CacheFailure(errorMessage: e.toString()), null);
    }
  }

  @override
  Future<bool> store({required Wrapper wrapper}) => _preferences.write<String>(
        key: PreferencesEnum.pois.cachedName,
        value: wrapper.toJson,
      );

  @override
  Stadium getStadium(String id) {
    final wrapperJson =
        _preferences.read<String>(key: PreferencesEnum.pois.cachedName) ?? '';
    if (wrapperJson.isEmpty) return const Stadium();
    return Wrapper.fromJson(wrapperJson)
        .stadiums
        .firstWhere((stadium) => stadium.id == id);
  }
}
