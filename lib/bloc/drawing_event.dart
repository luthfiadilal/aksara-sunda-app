import 'package:equatable/equatable.dart';

abstract class DrawingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CaptureDrawingEvent extends DrawingEvent {}

class ClearDrawingEvent extends DrawingEvent {}
