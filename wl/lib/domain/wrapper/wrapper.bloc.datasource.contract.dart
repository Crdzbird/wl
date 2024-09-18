import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';

abstract class WrapperBlocDataSourceContract {
  Future<(Failure?, Wrapper?)> fetch();
  Future<(Failure, Wrapper)> filter();
}
