part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();
  @override
  List<Object> get props => [];
}

class OnSuccessEvent extends DetailEvent {
  const OnSuccessEvent({
    required this.stadium,
  });
  final Stadium stadium;

  @override
  List<Object> get props => [stadium];
}

class OnFailureEvent extends DetailEvent {
  const OnFailureEvent(this.error);
  final String error;
}

class OnLoadingEvent extends DetailEvent {
  const OnLoadingEvent();
}
