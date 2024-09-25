part of 'position_bloc.dart';

sealed class PositionState extends Equatable {
  const PositionState();

  @override
  List<Object> get props => [];
}

final class PositionInitialState extends PositionState {}

final class PositionLoadingState extends PositionState {}

final class PositionSuccesState extends PositionState {
  final Position position;

  const PositionSuccesState({required this.position});
  @override
  List<Object> get props => [position];
}

final class PositionErrorState extends PositionState {
  final String errorMessage;

  const PositionErrorState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
