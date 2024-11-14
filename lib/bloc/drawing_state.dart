import 'package:aksara_sunda/models/drawing_model.dart';
import 'package:equatable/equatable.dart';

abstract class DrawingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DrawingInitial extends DrawingState {}

class DrawingCaptured extends DrawingState {
  final DrawingModel drawing;

  DrawingCaptured(this.drawing);

  @override
  List<Object?> get props => [drawing];
}

class DrawingEmpty extends DrawingState {}

class DrawingLoading extends DrawingState {}
