import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wl/presentation/dashboard/bloc/poi_bloc.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoiBloc, PoiState>(
      builder: (context, state) {
        if (state is OnLoadingState || state is OnFailedState) {
          return const Center(child: CircularProgressIndicator());
        }
        return const Text('Data loaded');
      },
    );
  }
}
