import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:classic_eccomerce/app_settings/app_settings_cubit/app_settings_states.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/core/constants/paths/sound_paths.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:classic_eccomerce/core/helpers/dio_helper.dart';
import 'package:classic_eccomerce/core/locales/l10n/app_localizations.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:classic_eccomerce/register_attendance_by_location/data/data_sources/remote_data_sources/attendance_by_location_apis.dart';
import 'package:classic_eccomerce/register_attendance_by_location/data/models/get_geo_fences_response.dart';
import 'package:classic_eccomerce/shared_components/app_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_auth/local_auth.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/helpers/location_finder_gps.dart';
import 'attendance_by_location_states.dart';

class AttendanceByLocationCubit extends Cubit<AttendanceByLocationStates> {
  AttendanceByLocationCubit() : super(AttendanceByLocationInitialState());

  static AttendanceByLocationCubit get(context) => BlocProvider.of(context);

  BuildContext context = MyApp.navKey.currentState!.context;
  bool isScreenLoading = false;
  bool isGPSEnabled = false;
  Location? location;
  CameraPosition? initialCameraPosition =
      const CameraPosition(target: LatLng(0, 0), zoom: 14);
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  // late MapboxMapController controller;
  StreamSubscription<LocationData>? locationSubscription;
  LatLng? currentUserLocation;
  Set<Circle> circles = {};

  List<GeoFenceItem> geoFences = [];
  bool isInsideAGeoFence = false;

  void checkGeoFences() {
    for (var geoFence in geoFences) {
      double distance = Geolocator.distanceBetween(
        geoFence?.latitude ?? 0,
        geoFence?.longitude ?? 0,
        currentUserLocation?.latitude ?? 0,
        currentUserLocation?.longitude ?? 0,
      );

      if (distance <= (geoFence.radiusMeters ?? 0)) {
        print("🚀 User is inside geofence: ");
        isInsideAGeoFence = true;

        circles.clear();
        circles.addAll(geoFences
                ?.map<Circle>((e) => Circle(
                      fillColor: geoFence.id == e.id
                          ? Colors.green.withOpacity(0.2)
                          : AppColors.APP_MAIN_COLOR.withOpacity(0.2),
                      circleId: CircleId(e.id.toString() ?? ""),
                      center: LatLng(e.latitude ?? 0, e.longitude ?? 0)!,
                      radius: e.radiusMeters ?? 0,
                      strokeColor: geoFence.id == e.id
                          ? Colors.green
                          : AppColors.APP_MAIN_COLOR,
                      strokeWidth: 2,
                    ))
                ?.toSet() ??
            {});


        emit(ChangeState());

        break;

      } else {
        isInsideAGeoFence = false;
      }
    }

    emit(ChangeState());
  }

  registerAttendance(String baseUrl) async {

    AttendanceByLocationApis apis = AttendanceByLocationApis(DioHelper()..init(baseUrl));

    if(isInsideAGeoFence == false){
      showAppSnackBar(content: AppLocalizations.of(context)!.you_are_out_of_work_range);
      return;
    }

// ···

    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Fingerprint authentication is possible
      try {
        bool authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to access your account',
          options: const AuthenticationOptions(
            stickyAuth: true,

          ),
        );

        print(authenticated);
        if (authenticated) {
          // User successfully authenticated
          var employeeId = MyApp.navKey.currentState?.context.read<AuthCubit>()?.loginResponse?.loginData?.employeeId;
          emit(RegisterAttendanceByLocationLoadingState());

          var response = await apis.registerAttendanceOrDismissal(
              employeeId??0,
              currentUserLocation?.latitude ?? 0,
              currentUserLocation?.longitude ?? 0,
              1);

          if (response?.success == true) {
            showAppSnackBar(content: response?.message ?? "");
            emit(RegisterAttendanceByLocationSuccessState());
          }
          else if (response?.success == false) {
            showAppSnackBar(content: response?.message ?? "");
            emit(RegisterAttendanceByLocationFailedState());
          }
          else {
            showAppSnackBar(
                content: AppLocalizations.of(context)!
                    .check_your_internet_connection_and_try_again_later);

            emit(RegisterAttendanceByLocationNWConnectionFailedState());
          }
        } else {
          // User failed to authenticate or canceled
        }
      } on PlatformException catch (e) {
        // Handle platform-specific errors
        print(e);
      }


    }

  }

  registerDismissal(String baseUrl) async {
    AttendanceByLocationApis apis = AttendanceByLocationApis(DioHelper()..init(baseUrl));

    if(isInsideAGeoFence == false){
      showAppSnackBar(content: AppLocalizations.of(context)!.you_are_out_of_work_range);
      return;
    }

    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Fingerprint authentication is possible
      try {
        bool authenticated = await auth.authenticate(
          localizedReason: 'Please authenticate to access your account',
          options: const AuthenticationOptions(
            stickyAuth: true,

          ),
        );

        print(authenticated);
        if (authenticated) {
          // User successfully authenticated
          var employeeId = MyApp.navKey.currentState?.context.read<AuthCubit>()?.loginResponse?.loginData?.employeeId;
          emit(RegisterAttendanceByLocationLoadingState());

          var response = await apis.registerAttendanceOrDismissal(
              employeeId??0,
              currentUserLocation?.latitude ?? 0,
              currentUserLocation?.longitude ?? 0,
              2);

          if (response?.success == true) {
            showAppSnackBar(content: response?.message ?? "");
            emit(RegisterAttendanceByLocationSuccessState());
          }
          else if (response?.success == false) {
            showAppSnackBar(content: response?.message ?? "");
            emit(RegisterAttendanceByLocationFailedState());
          }
          else {
            showAppSnackBar(
                content: AppLocalizations.of(context)!
                    .check_your_internet_connection_and_try_again_later);

            emit(RegisterAttendanceByLocationNWConnectionFailedState());
          }
        } else {
          // User failed to authenticate or canceled
        }
      } on PlatformException catch (e) {
        // Handle platform-specific errors
        print(e);
      }


    }
  }

  // void checkGeofences(Position position) {
  //   bool isInsideAny = false;
  //
  //   for (GeoFence fence in fences) {
  //     double distance = Geolocator.distanceBetween(
  //       position.latitude,
  //       position.longitude,
  //       fence.lat,
  //       fence.lng,
  //     );
  //
  //     if (distance <= fence.radius) {
  //       print("🚀 User is inside geofence: ${fence.id}");
  //       isInsideAny = true;
  //     }
  //   }
  //
  //   if (!isInsideAny) {
  //     print("User is NOT inside any geofence");
  //   }
  // }

  init(String baseUrl) async {
    try {
      setLoadingScreen(true);

      setIsGPSEnabled(true);

      await setUserLocation();

      initialCameraPosition =
          CameraPosition(target: currentUserLocation!, zoom: 14);
      location = Location();
      // location?.changeSettings(interval: 3000);
      var permission = await Permission.locationAlways.isGranted;
      if (!permission) {
        var t = await Permission.locationAlways.request();
      }
      // await location?.enableBackgroundMode(enable: true);

      await setGeoFences(baseUrl);
      checkGeoFences();

      // listenToLocationChanges();

      setLoadingScreen(false);
    } catch (e) {
      if (kDebugMode) {
        print("GPS Exception: $e");
      }

      if (e.toString() == "Exception: Location services are disabled.") {
        setIsGPSEnabled(false);
      }

      setLoadingScreen(false);
    }
  }

  setGeoFences(String baseUrl) async {
    AttendanceByLocationApis apis = AttendanceByLocationApis(DioHelper()..init(baseUrl));

    var response = await apis.getGeoFences(baseUrl);

    if (response?.isSuccssed == true) {
      geoFences = response?.geofences ?? [];
      circles.clear();
      circles.addAll(geoFences
              ?.map<Circle>((e) => Circle(
                    fillColor: AppColors.APP_MAIN_COLOR.withOpacity(0.2),
                    circleId: CircleId(e.id.toString() ?? ""),
                    center: LatLng(e.latitude ?? 0, e.longitude ?? 0)!,
                    radius: e.radiusMeters ?? 0,
                    strokeColor: AppColors.APP_MAIN_COLOR,
                    strokeWidth: 2,
                  ))
              ?.toSet() ??
          {});
    } else if (response?.isSuccssed == false) {
      showAppSnackBar(content: response?.message ?? "");
    } else {
      showAppSnackBar(
          content: AppLocalizations.of(context)!.network_connection_failed);
    }
  }

  listenToLocationChanges() async {
    await locationSubscription?.cancel();
    locationSubscription = location?.onLocationChanged.listen((event) {
      print("location changes: $event");

      currentUserLocation = LatLng(event.latitude!, event.longitude!);

      // var currentCameraPosition = CameraPosition(
      //     target: LatLng(event.latitude!, event.longitude!), zoom: 14);
      checkGeoFences();
    });
  }

  setUserLocation() async {
    var location = await determinePosition();

    //ToDo return correct location
    //currentDriverLocation = const LatLng(29.216695506321734, 48.0844424136259);
    currentUserLocation = LatLng(location.latitude, location.longitude);
  }

  setIsGPSEnabled(bool state) {
    isGPSEnabled = state;
    emit(ChangeState());
  }

  setLoadingScreen(bool state) {
    isScreenLoading = state;
    emit(ChangeState());
  }
}
