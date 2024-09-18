import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';

abstract class WrapperBlocDataSourceContract {
  Future<(Failure?, Wrapper?)> fetch();
  Stadium stadium(String id);
  Future<(Failure, Wrapper)> filter();
}
