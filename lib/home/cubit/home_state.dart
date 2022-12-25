import 'package:equatable/equatable.dart';

enum MainStatus { initial, loading, complete, error }

class HomeState extends Equatable {
  const HomeState({
    this.status = MainStatus.initial,
    this.imageUrl = '',
  });

  final MainStatus status;
  final String imageUrl;

  HomeState copyWith({
    MainStatus? status,
    String? imageUrl,
  }) {
    return HomeState(
      status: status ?? this.status,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [status, imageUrl];
}