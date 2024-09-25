part of 'position_bloc.dart';

sealed class PositionEvent extends Equatable {
  const PositionEvent();

  @override
  List<Object> get props => [];
}

class FecthPosition extends PositionEvent {}
