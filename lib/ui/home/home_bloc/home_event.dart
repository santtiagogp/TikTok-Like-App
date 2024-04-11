part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class OnInit extends HomeEvent {}

class OnReachTwo extends HomeEvent {}
