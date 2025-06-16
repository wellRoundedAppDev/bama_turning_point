// import 'package:flutter/cupertino.dart';
//
// class RegisterAttendanceScreen extends StatelessWidget {
//   const RegisterAttendanceScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       compassEnabled: false,
//       myLocationEnabled: true,
//       zoomControlsEnabled: false,
//       myLocationButtonEnabled: false,
//       mapToolbarEnabled: false,
//       onTap: (latLng) {
//         if (kDebugMode) {
//           print(latLng);
//         }
//       },
//       onCameraMove: (cameraPosition) {
//         if (wenshServicesCubit
//             .userCanSelectLocationFromMap ==
//             true) {
//           context
//               .read<WenshServicesCubit>()
//               .draggedLatLng = cameraPosition.target;
//         }
//       },
//       onCameraIdle: () async {
//         if (wenshServicesCubit
//             .userCanSelectLocationFromMap ==
//             true) {
//           var draggedLatLng = context
//               .read<WenshServicesCubit>()
//               .draggedLatLng;
//           if (draggedLatLng == null) {
//             context
//                 .read<WenshServicesCubit>()
//                 .draggedLatLng =
//                 context
//                     .read<WenshServicesCubit>()
//                     .currentUserLocation;
//             draggedLatLng = context
//                 .read<WenshServicesCubit>()
//                 .currentUserLocation;
//           }
//
//           await context
//               .read<WenshServicesCubit>()
//               .onDraggedPinStopped(draggedLatLng!);
//         }
//       },
//       mapType: MapType.normal,
//       initialCameraPosition: context
//           .read<WenshServicesCubit>()
//           .initialCameraPosition!,
//       onMapCreated: (GoogleMapController controller) {
//         if (context
//             .read<WenshServicesCubit>()
//             .controller
//             ?.isCompleted ==
//             false) {
//           context
//               .read<WenshServicesCubit>()
//               .controller
//               ?.complete(controller);
//         } else {
//           context
//               .read<WenshServicesCubit>()
//               .controller =
//               Completer<GoogleMapController>();
//           context
//               .read<WenshServicesCubit>()
//               .controller
//               ?.complete(controller);
//         }
//       },
//       markers: wenshServicesCubit.mapMarkers,
//     );
//   }
// }
