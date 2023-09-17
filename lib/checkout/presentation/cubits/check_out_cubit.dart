import 'package:classic_eccomerce/checkout/presentation/cubits/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutCubit extends Cubit<CheckOutStates> {
  CheckOutCubit() : super(CheckOutInitialState());


  static CheckOutCubit get(BuildContext context) => BlocProvider.of(context);
}
