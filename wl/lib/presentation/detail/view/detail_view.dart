import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wl/presentation/dashboard/widgets/poi_card.dart';
import 'package:wl/presentation/detail/bloc/detail_bloc.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail for Stadium'),
      ),
      body: BlocBuilder<DetailBloc, DetailState>(
        builder: (context, state) {
          if (state is OnSuccessState) return PoiCard(state.stadium);
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
