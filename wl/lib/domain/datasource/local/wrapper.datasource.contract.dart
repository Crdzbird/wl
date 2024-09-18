import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';

abstract class WrapperDataSourceContract {
  (Failure?, Wrapper?) get();
  Future<bool> store({required Wrapper wrapper});
}
