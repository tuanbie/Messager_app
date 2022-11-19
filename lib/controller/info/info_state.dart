import 'package:equatable/equatable.dart';
import 'package:messager_app/models/info.dart';

class InfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InfoInitState extends InfoState {}

class InfoLoadingState extends InfoState {
  final String message;
  InfoLoadingState({required this.message});
}

class InfoSuccessState extends InfoState {
  final Info info;
  InfoSuccessState({required this.info});
}

class InfoErrorState extends InfoState {
  final String message;
  InfoErrorState({required this.message});
}
