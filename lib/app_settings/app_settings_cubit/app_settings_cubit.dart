import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_states.dart';
import 'package:classic_eccomerce/core/constants/paths/sound_paths.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/presentation/auth_cubit/auth_cubit.dart';

class AppSettingsCubit extends Cubit<AppSettingsStates>{
  AppSettingsCubit():super(AppSettingsInitialState());

  static AppSettingsCubit get(context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;

  String currencyCode = "IQD";
  // late AudioPlayer player = AudioPlayer();

  changeCurrency(String currencyCode){
    this.currencyCode = currencyCode;
    emit(ChangeCurrencyState());
  }

  launchApp(){
    //NotificationsCubit.get(context).init();
    //
    // player = AudioPlayer();
    //
    // // Set the release mode to keep the source after playback has completed.
    // player.setReleaseMode(ReleaseMode.stop);
    //
    // // Start the player as soon as the app is displayed.
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await player
    //       .setSource(AssetSource(SoundPaths.BIKE_IGNITION));
    //   player.resume();
    //
    // });

    // AuthCubit.get(context).autoLogin(cartCubit: CartCubit.get(context));

  }



}