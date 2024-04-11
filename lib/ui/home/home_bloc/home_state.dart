part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFetched extends HomeState {

  HomeFetched(this.videos, this.reachedTwo);

  final List<VideoModel> videos;
  final bool reachedTwo;
}
