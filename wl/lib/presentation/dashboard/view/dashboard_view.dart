import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wl/core/l10n/l10n.dart';
import 'package:wl/presentation/dashboard/bloc/poi_bloc.dart';
import 'package:wl/presentation/dashboard/widgets/filter_widget.dart';
import 'package:wl/presentation/dashboard/widgets/poi_listview.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.poi),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const FilterWidget(),
            BlocBuilder<PoiBloc, PoiState>(
              builder: (context, state) {
                if (state is OnLoadingState || state is OnFailedState) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return PoiListView((state as OnSuccessState).wrapper.stadiums);
              },
            ),
          ],
        ),
      ),
    );
  }
}
