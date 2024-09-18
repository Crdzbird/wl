import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCubit extends Cubit<String> {
  FilterCubit() : super('');

  String get query => state;

  void onChangeQuery(String? query) => emit(query ?? '');
}
