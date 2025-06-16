import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'request_holiday_state.dart';

class RequestHolidayCubit extends Cubit<RequestHolidayState> {
  RequestHolidayCubit() : super(RequestHolidayInitial());
  static RequestHolidayCubit get(BuildContext context) => BlocProvider.of(context);

  String? selectedType;
  DateTime? fromDate;
  DateTime? toDate;
  final reasonController = TextEditingController();
  final List<String> holidayTypes = ['سنوية', 'مرضية', 'عارضة'];

  void selectHolidayType(String? value){
    selectedType=value;
    emit(SelectedTypeHolidayState());
  }

  Future<void> pickDate(context,bool isFrom) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
        emit(ChoiceDateHolidayState());
    }
  }

  void save(){
    print(selectedType);
    print(fromDate);
    print(toDate);
    print(reasonController);

  }

}
