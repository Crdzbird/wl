import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wl/presentation/dashboard/bloc/filter/filter_cubit.dart';
import 'package:wl/presentation/dashboard/widgets/filter_widget.dart';

class FilterProvider extends StatelessWidget {
  const FilterProvider({
    FilterCubit? cubit,
    TextEditingController? controller,
    super.key,
  })  : _cubit = cubit,
        _controller = controller;

  final FilterCubit? _cubit;
  final TextEditingController? _controller;

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: _cubit ?? FilterCubit(),
        child: FilterWidget(
          controller: _controller,
        ),
      );
}
