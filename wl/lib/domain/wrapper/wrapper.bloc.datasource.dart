import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/domain/datasource/local/wrapper.datasource.contract.dart';
import 'package:wl/domain/datasource/remote/remote_wrapper.datasource.contract.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.contract.dart';

class WrapperBlocDataSource extends WrapperBlocDataSourceContract {
  WrapperBlocDataSource(
    RemoteWrapperDataSourceContract remoteDataSource,
    WrapperDataSourceContract localDataSource,
  )   : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  final RemoteWrapperDataSourceContract _remoteDataSource;
  final WrapperDataSourceContract _localDataSource;
  @override
  Future<(Failure?, Wrapper?)> fetch() async {
    final result = await _remoteDataSource.fetch();
    if (result.$1 != null) return _localDataSource.get();
    final storageResult = await _localDataSource.store(wrapper: result.$2!);
    if (storageResult) return result;
    return (CacheFailure(errorMessage: 'Failed to store data'), null);
  }

  @override
  Future<(Failure, Wrapper)> filter() {
    // TODO(Crdzbird): implement filter
    throw UnimplementedError();
  }
}
