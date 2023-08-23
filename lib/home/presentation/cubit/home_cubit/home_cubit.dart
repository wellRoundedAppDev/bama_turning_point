import 'package:classic_eccomerce/home_layout/presentation/cubits/app_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<AppStates> {
  HomeCubit() : super(AppInitialState());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);



}
