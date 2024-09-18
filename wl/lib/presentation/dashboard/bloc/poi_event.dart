part of 'poi_bloc.dart';

abstract class PoiEvent extends Equatable {
  const PoiEvent();
  @override
  List<Object> get props => [];
}

class OnSuccessEvent extends PoiEvent {
  const OnSuccessEvent({
    required this.wrapper,
  });
  final Wrapper wrapper;

  @override
  List<Object> get props => [wrapper];
}

class OnFailureEvent extends PoiEvent {
  const OnFailureEvent(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class OnLoadingEvent extends PoiEvent {
  const OnLoadingEvent();
}
