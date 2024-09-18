import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/remote/api/dio_contract.dart';
import 'package:wl/domain/datasource/local/wrapper.datasource.contract.dart';
import 'package:wl/domain/datasource/local/wrapper.datasource.dart';
import 'package:wl/domain/datasource/remote/remote_wrapper.datasource.contract.dart';
import 'package:wl/domain/datasource/remote/remote_wrapper.datasource.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.contract.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.dart';
import 'package:wl/presentation/detail/bloc/detail_bloc.dart';
import 'package:wl/presentation/detail/view/detail_view.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen(@PathParam('id') String id, {super.key}) : _id = id;

  final String _id;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<RemoteWrapperDataSourceContract>(
          create: (rpContext) =>
              RemoteWrapperDataSource(rpContext.read<DioContract>()),
        ),
        RepositoryProvider<WrapperDataSourceContract>(
          create: (rpContext) => WrapperDataSource(
            rpContext.read<PreferencesDataSourceContract>(),
          ),
        ),
        RepositoryProvider<WrapperBlocDataSourceContract>(
          create: (rpContext) => WrapperBlocDataSource(
            rpContext.read<RemoteWrapperDataSourceContract>(),
            rpContext.read<WrapperDataSourceContract>(),
          ),
        ),
      ],
      child: BlocProvider<DetailBloc>(
        create: (bpContext) => DetailBloc(
          wrapperBlocDataSource:
              bpContext.read<WrapperBlocDataSourceContract>(),
        )..fetchStadium(_id),
        child: const DetailView(),
      ),
    );
  }
}
