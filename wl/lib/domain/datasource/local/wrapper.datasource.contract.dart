import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';

abstract class WrapperDataSourceContract {
  (Failure?, Wrapper?) get();
  Stadium getStadium(String id);
  Future<bool> store({required Wrapper wrapper});
}
