part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class OnLoadingState extends DetailState {}

class OnFailedState extends DetailState {
  const OnFailedState(this.error);
  final String error;
}

class OnSuccessState extends DetailState {
  const OnSuccessState({this.stadium = const Stadium()});
  final Stadium stadium;

  @override
  List<Object> get props => [stadium];
}
