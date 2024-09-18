part of 'poi_bloc.dart';

abstract class PoiState extends Equatable {
  const PoiState();

  @override
  List<Object> get props => [];
}

class OnLoadingState extends PoiState {}

class OnFailedState extends PoiState {
  const OnFailedState(this.error);
  final String error;
}

class OnSuccessState extends PoiState {
  const OnSuccessState({this.wrapper = const Wrapper()});
  final Wrapper wrapper;

  @override
  List<Object> get props => [wrapper];
}
