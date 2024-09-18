import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wl/presentation/dashboard/bloc/filter/filter_cubit.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    super.key,
    TextEditingController? controller,
  }) : _controller = controller;

  final TextEditingController? _controller;

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: widget._controller,
        onChanged: context.read<FilterCubit>().onChangeQuery,
        keyboardType: TextInputType.text,
        onSubmitted: context.read<FilterCubit>().onChangeQuery,
      ),
    );
  }
}
