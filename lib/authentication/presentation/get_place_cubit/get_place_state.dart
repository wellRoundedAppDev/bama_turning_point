part of 'get_place_cubit.dart';

@immutable
sealed class GetPlaceState {}

final class GetPlaceInitial extends GetPlaceState {}



final class GetGovernorateLoadingState extends GetPlaceState {}
final class GetGovernorateSuccessfulState extends GetPlaceState {}
final class GetGovernorateFailedState extends GetPlaceState {}
final class SelectedGovernorateState extends GetPlaceState {}



final class GetJudiciaryLoadingState extends GetPlaceState {}
final class GetJudiciarySuccessfulState extends GetPlaceState {}
final class GetJudiciaryFailedState extends GetPlaceState {}
final class SelectedJudiciaryState extends GetPlaceState {}


final class GetWayLoadingState extends GetPlaceState {}
final class GetWaySuccessfulState extends GetPlaceState {}
final class GetWayFailedState extends GetPlaceState {}
final class SelectedWayState extends GetPlaceState {}


