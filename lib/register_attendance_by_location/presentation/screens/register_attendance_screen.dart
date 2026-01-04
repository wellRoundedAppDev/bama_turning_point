import 'dart:async';

import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/server_urls_and_keys/api_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../core/locales/l10n/app_localizations.dart';
import '../../../shared_components/gps_not_enabled_refresh_page.dart';
import '../cubit/attendance_by_location_cubit.dart';
import '../cubit/attendance_by_location_states.dart';

class RegisterAttendanceByLocationScreen extends StatefulWidget {
  const RegisterAttendanceByLocationScreen({super.key});

  @override
  State<RegisterAttendanceByLocationScreen> createState() =>
      RegisterAttendanceByLocationScreenState();
}

class RegisterAttendanceByLocationScreenState
    extends State<RegisterAttendanceByLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendanceByLocationCubit()..init(ApiUrls.BASE_URL),
      child:
          BlocConsumer<AttendanceByLocationCubit, AttendanceByLocationStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AttendanceByLocationCubit cubit =
              AttendanceByLocationCubit.get(context);
          bool isScreenLoading = cubit.isScreenLoading;

          var circles = cubit.circles;

          return Scaffold(
            body: (isScreenLoading == true)
                ? const Center(child: CircularProgressIndicator())
                : (cubit.isGPSEnabled == false)
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GPSNotEnabledRefreshPage(refresh: () {
                          cubit.init(ApiUrls.BASE_URL);
                        }),
                      )
                    : Stack(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: GoogleMap(
                                compassEnabled: false,
                                myLocationEnabled: true,
                                zoomControlsEnabled: false,
                                myLocationButtonEnabled: false,
                                mapType: MapType.normal,
                                onTap: (latLng) {
                                  if (kDebugMode) {
                                    print(latLng);
                                  }
                                },
                                circles: circles,
                                // polylines: cubit.polyLines,
                                // markers: cubit.mapMarkers,
                                initialCameraPosition:
                                    cubit.initialCameraPosition!,
                                onMapCreated: (GoogleMapController controller) {
                                  if (cubit.controller.isCompleted == false) {
                                    cubit.controller.complete(controller);
                                  } else {
                                    cubit.controller =
                                        Completer<GoogleMapController>();
                                    cubit.controller.complete(controller);
                                  }
                                },
                              )),
                          Positioned(
                            top: 45,
                            left: 16,
                            child: GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      topLeft: Radius.circular(40))),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    "تسجيل حضور والانصراف باللوكشن",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: FontSizes.FONT_SIZE_18,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){
                                            cubit.registerAttendance(ApiUrls.BASE_URL);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: const BoxDecoration(
                                                color: AppColors.APP_MAIN_COLOR,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(100),
                                                )),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white,
                                                  ),
                                                  child: Center(
                                                    child: Icon(
                                                      Icons.login,
                                                      size: 18,
                                                      color: AppColors
                                                          .APP_MAIN_COLOR,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    AppLocalizations.of(context)!
                                                        .login,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){
                                            cubit.registerDismissal(ApiUrls.BASE_URL);
                                        
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color:
                                                        AppColors.APP_MAIN_COLOR),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(100),
                                                )),
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors
                                                        .APP_MAIN_COLOR
                                                        .withOpacity(0.2),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.logout,
                                                      size: 18,
                                                      color: AppColors
                                                          .APP_MAIN_COLOR,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    AppLocalizations.of(context)!
                                                        .log_out,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: AppColors
                                                            .APP_MAIN_COLOR,
                                                        fontSize: FontSizes
                                                            .FONT_SIZE_14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
          );
        },
      ),
    );
  }
}
