import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/home_layout/presentation/cubits/app_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<CheckOutStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  int currentNavbarIndex = 5;


  changeNavBarIndex(int index) {
    currentNavbarIndex = index;

    emit(AppNavigationChangedState());
  }
}
