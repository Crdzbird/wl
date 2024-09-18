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
import 'package:wl/presentation/dashboard/bloc/filter/filter_cubit.dart';
import 'package:wl/presentation/dashboard/bloc/poi_bloc.dart';
import 'package:wl/presentation/dashboard/view/dashboard_view.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FilterCubit>(
            create: (_) => FilterCubit(),
          ),
          BlocProvider<PoiBloc>(
            create: (bpContext) => PoiBloc(
              wrapperBlocDataSource:
                  bpContext.read<WrapperBlocDataSourceContract>(),
              filterCubit: bpContext.read<FilterCubit>(),
            )..fetchPois(),
          ),
        ],
        child: const DashboardView(),
      ),
    );
  }
}
