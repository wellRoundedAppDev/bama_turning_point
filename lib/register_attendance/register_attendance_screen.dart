import 'dart:async';

import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterAttendanceScreen extends StatefulWidget {
  const RegisterAttendanceScreen({super.key});

  @override
  State<RegisterAttendanceScreen> createState() =>
      RegisterAttendanceScreenState();
}

class RegisterAttendanceScreenState extends State<RegisterAttendanceScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  Location location = Location();
  LocationData? locationData;
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;

  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setUserLocation();
  }

  setUserLocation() async {
    isLoading = true;
    setState(() {});

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        isLoading = false;
        setState(() {});
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        isLoading = false;
        setState(() {});
        return;
      }
    }

    locationData = await location.getLocation();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(locationData?.latitude ?? 0,
                          locationData?.longitude ?? 0),
                      zoom: 14),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Positioned(
                  top: 45,
                  left: 16,
                  child: GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
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
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
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
                                          color: AppColors.APP_MAIN_COLOR,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.of(context)!.login,
                                        overflow: TextOverflow.ellipsis,
                                      
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: FontSizes.FONT_SIZE_14,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: AppColors.APP_MAIN_COLOR),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(100),
                                    )),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.APP_MAIN_COLOR
                                            .withOpacity(0.2),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.logout,
                                          size: 18,
                                          color: AppColors.APP_MAIN_COLOR,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Flexible(
                                      child: Text(
                                        AppLocalizations.of(context)!.log_out,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            color: AppColors.APP_MAIN_COLOR,
                                            fontSize: FontSizes.FONT_SIZE_14,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
