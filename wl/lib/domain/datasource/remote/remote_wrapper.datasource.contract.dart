import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';

abstract class RemoteWrapperDataSourceContract {
  Future<(Failure?, Wrapper?)> fetch();
  void filter();
}
