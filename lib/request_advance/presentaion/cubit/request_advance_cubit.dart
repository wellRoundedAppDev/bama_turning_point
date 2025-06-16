import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'request_advance_state.dart';

class RequestAdvanceCubit extends Cubit<RequestAdvanceState> {
  RequestAdvanceCubit() : super(RequestAdvanceInitial());
  static RequestAdvanceCubit get(BuildContext context) => BlocProvider.of(context);

  final priceController = TextEditingController();
  final installmentsController = TextEditingController();
  DateTime? date;

  Future<void> pickDate(context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
        date = picked;

      emit(ChoiceDateAdvanceState());
    }
  }

  void save(){

  }

}
