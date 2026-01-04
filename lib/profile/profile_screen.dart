import 'package:classic_eccomerce/Attendance/presentation/screens/Attendance_Departure.dart';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/employement_details/employment_details_screen.dart';
import 'package:classic_eccomerce/profile/profile_screen_2.dart';
import 'package:classic_eccomerce/request_advance/presentaion/screen/request_advance_screen.dart';
import 'package:classic_eccomerce/revealing_ranks/presentation/screen/revealing_ranks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../core/locales/l10n/app_localizations.dart';
import '../register_attendance_by_location/presentation/screens/register_attendance_screen.dart';
import '../request_holiday/presentaion/screen/request_holiday_screen.dart';
import '../shared_components/custom_alert2.dart';



class PersonalProfileScreen extends StatelessWidget {
  const PersonalProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                _buildCustomAppBar(),
                Expanded(child: _buildGridMenu()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      _buildLogoutButton(),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(ImagePaths.GREY_CURVY_DECORATION))
          ],
        ),
      ),
    );
  }



  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: const Color(0xFF002366),
      child: const Column(
        children: [
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Icon(Icons.notifications, color: Colors.orangeAccent),
          // ),
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(ImagePaths.APP_LOGO), // Replace with actual image
          ),
          SizedBox(height: 10),
          Text(
            "محمد",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Stack(
      children: [
        SizedBox(
        width: double.infinity,

        height:MediaQuery.of(context)!.size.height * 0.25,
        ),

        Builder(
          builder: (context) {
            return Container(
              height: MediaQuery.of(context)!.size.height * 0.16,
              decoration: BoxDecoration(
                color: AppColors.APP_SECONDARY_COLOR, // dark blue
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.only(top: 40),
              child: const Text(
                "الملف الشخصي",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: FontSizes.FONT_SIZE_16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        ),

        Positioned(
          top: MediaQuery.of(context)!.size.height * 0.093,
          left: 0,
          right: 0,
          child: const Column(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(ImagePaths.APP_LOGO), // Replace with actual image
              ),

              // CircleAvatar(
              //   radius: MediaQuery.of(context)!.size.height * 0.075,
              //   backgroundImage: const NetworkImage("https://i.imgur.com/BoN9kdC.png"),
              // ),
              SizedBox(height: 8,),
              Text(
                "",
                style: TextStyle(fontSize: FontSizes.FONT_SIZE_16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Notification icon in orange curved corner
        // const Positioned(
        //   top: 45,
        //   right: 16,
        //   child:
        //     Icon(Icons.notifications,color: Colors.white,)
        //   // ClipPath(
        //   //   clipper: CornerClipper(),
        //   //   child: Container(
        //   //     width: 60,
        //   //     height: 60,
        //   //     color: Colors.orange,
        //   //     child: Center(
        //   //       child: Icon(Icons.notifications, color: Colors.white),
        //   //     ),
        //   //   ),
        //   // ),
        // ),
        // Positioned(
        //     top: 45,
        //     left: 16,
        //     child:
        //     GestureDetector(
        //         onTap: (){
        //           Navigator.pop(context);
        //         },
        //         child: const Icon(Icons.arrow_forward_ios,color: Colors.white,))
        //   // ClipPath(
        //   //   clipper: CornerClipper(),
        //   //   child: Container(
        //   //     width: 60,
        //   //     height: 60,
        //   //     color: Colors.orange,
        //   //     child: Center(
        //   //       child: Icon(Icons.notifications, color: Colors.white),
        //   //     ),
        //   //   ),
        //   // ),
        // ),

        // Profile picture and name
      ],
    );
  }
  Widget _buildGridMenu() {
    final List<_MenuItem> menuItems = [
      _MenuItem("البيانات الشخصية", Image.asset(ImagePaths.PERSONAL_INFORMATION_ICON,
        color: AppColors.APP_MAIN_COLOR,

        fit: BoxFit.cover,
      ),),
      // _MenuItem("البيانات الوظيفية", Image.asset(ImagePaths.JOB_INFORMATION_ICON,
      //   color: AppColors.APP_MAIN_COLOR,
      //
      // )),
      // _MenuItem("الحضور والانصراف", Image.asset(ImagePaths.ATTENDANCE_ICON,
      //   color: AppColors.APP_MAIN_COLOR,
      //
      // )),
      // _MenuItem("الاجازات", Image.asset(ImagePaths.HOLIDAYS_ICON,
      //   color: AppColors.APP_MAIN_COLOR,
      //
      // )),
      // _MenuItem("كشف الراتب", Image.asset(ImagePaths.PERSONAL_INFORMATION_ICON,
      //   color: AppColors.APP_MAIN_COLOR,
      // )),

      _MenuItem("الحضور والانصراف وفق الموقع", Image.asset(ImagePaths.ATTENDANCE_LOCATION_ICON,
        color: AppColors.APP_MAIN_COLOR,
      )),

      // _MenuItem("طلب سلفة", Image.asset(ImagePaths.CONTRACT_ICON,
      //   color: AppColors.APP_MAIN_COLOR,
      // )),

    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color:  Colors.white,
              border: Border.all(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                if(index == 0){
                  Navigator.push(context, PageTransition(child: const PersonalDataScreen(), type: PageTransitionType.leftToRight));
                }
                else if(index == 1){
                  Navigator.push(context, PageTransition(child:  const RegisterAttendanceByLocationScreen(), type: PageTransitionType.leftToRight));

                  // Navigator.push(context, PageTransition(child: const EmploymentDetailsScreen(), type: PageTransitionType.leftToRight));

                }else if(index == 2){
                  Navigator.push(context, PageTransition(child: const AttendanceScreen(), type: PageTransitionType.leftToRight));

                }else if(index == 3){
                  Navigator.push(context, PageTransition(child:  RequestHolidayScreen(), type: PageTransitionType.leftToRight));

                }else if(index == 4){
                  Navigator.push(context, PageTransition(child:   const RevealingRanksScreen(), type: PageTransitionType.leftToRight));

                }
                else if(index == 5){
                  Navigator.push(context, PageTransition(child:  const RegisterAttendanceByLocationScreen(), type: PageTransitionType.leftToRight));

                }else{
                  Navigator.push(context, PageTransition(child:  RequestAdvanceScreen(), type: PageTransitionType.leftToRight));

                }

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: item.icon),
                  const SizedBox(height: 10),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: FontSizes.FONT_SIZE_12, color: Colors.black,
                    fontWeight: FontWeight.w500,

                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLogoutButton() {
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GestureDetector(
        onTap: (){
          context.read<AuthCubit>().logOut();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.LOG_OUT_ICON,),
            const SizedBox(width: 5),
            Text(AppLocalizations.of(context)!.log_out, style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16)),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final  icon;
  final bool isSelected;

  _MenuItem(this.title, this.icon, {this.isSelected = false});
}


class CornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.arcToPoint(
      const Offset(0, 0),
      radius: const Radius.circular(60),
      clockwise: false,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}