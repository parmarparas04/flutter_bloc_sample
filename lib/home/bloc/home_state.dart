part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class InitState extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends HomeState {
  final String loadingStatus;
  final IconData? icon;

  const LoadingState(
    this.loadingStatus, {
    this.icon,
  });
  @override
  List<Object?> get props => [
        loadingStatus,
        icon,
      ];
}
