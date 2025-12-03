import '../../data/model/source_model.dart';

abstract class SourceState {}

class SourceInitial extends SourceState {}

class SourceLoading extends SourceState {}

class SourceSuccess extends SourceState {
  final SourceModel sources;
  SourceSuccess(this.sources);
}

class SourceError extends SourceState {
  final String message;
  SourceError(this.message);
}

class IndexState extends SourceState{
  final int currentIndex;
  final String id;
  final SourceModel sources;
  IndexState({required this.currentIndex,required this.id,required this.sources});
}