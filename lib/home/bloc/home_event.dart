part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadHomeEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ApiCallEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
