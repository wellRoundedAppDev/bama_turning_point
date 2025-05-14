part of 'filter_cubit.dart';

@immutable
sealed class FilterState {}

final class FilterInitial extends FilterState {}

final class FetchingFilterLoadingState extends FilterState {}

final class FetchingFilterSuccessState extends FilterState {}

final class FetchingFilterFailedState extends FilterState {}

final class CreateFilterLoadingState extends FilterState {}

final class CreateFilterSuccessState extends FilterState {}

final class CreateFilterFailedState extends FilterState {}

final class FilterNetworkFailedConnectionState extends FilterState {}

class FetchingMoreFilteredLoadingState extends FilterState {}
class FetchingMoreFilteredSuccessState extends FilterState {}
class FetchingMoreFilteredFailedState extends FilterState {}


final class FetchingPriceFilterState extends FilterState {}

final class SelectedRadioCompany extends FilterState {}
final class SelectedRadioGroup extends FilterState {}
final class SelectedRadioCategory extends FilterState {}
final class SelectedRadioSuppliers extends FilterState {}
final class SelectedRadioManufacture extends FilterState {}
final class SelectedRadioSize extends FilterState {}
final class SelectedRadioColor extends FilterState {}

final class DeleteSelectedRadio extends FilterState {}






