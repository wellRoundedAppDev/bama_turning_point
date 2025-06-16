part of 'request_holiday_cubit.dart';

@immutable
sealed class RequestHolidayState {}

final class RequestHolidayInitial extends RequestHolidayState {}

final class ChoiceDateHolidayState extends RequestHolidayState {}

final class SelectedTypeHolidayState extends RequestHolidayState {}


