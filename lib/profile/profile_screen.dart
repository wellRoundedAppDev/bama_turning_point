import 'package:classic_eccomerce/Attendance/presentation/screens/Attendance_Departure.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/employement_details/employment_details_screen.dart';
import 'package:classic_eccomerce/profile/profile_screen_2.dart';
import 'package:classic_eccomerce/register_attendance/register_attendance_screen.dart';
import 'package:classic_eccomerce/request_advance/presentaion/screen/request_advance_screen.dart';
import 'package:classic_eccomerce/revealing_ranks/presentation/screen/revealing_ranks_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../request_holiday/presentaion/screen/request_holiday_screen.dart';
import '../shared_components/custom_alert2.dart';



class PersonalProfileScreen extends StatelessWidget {
  final List<_MenuItem> menuItems = [
    _MenuItem("البيانات الشخصية", Icons.person, isSelected: true),
    _MenuItem("البيانات الوظيفية", Icons.work),
    _MenuItem("الحضور والانصراف", Icons.calendar_today),
    _MenuItem("الاجازات", Icons.warning),
    _MenuItem("كشف مرتب", Icons.attach_money),

    _MenuItem("الحضور والانصراف باللوكيشن", Icons.location_on),
    _MenuItem("طلب سلفة", Icons.request_page),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }



  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Color(0xFF002366),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.notifications, color: Colors.orangeAccent),
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://i.imgur.com/BoN9kdC.png"), // Replace with actual image
          ),
          SizedBox(height: 10),
          Text(
            "محمد عبد العزيز محمود بسيوني",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return Stack(
      children: [
        Container(
        width: double.infinity,

        height:MediaQuery.of(context)!.size.height * 0.28,
        ),

        Builder(
          builder: (context) {
            return Container(
              height: MediaQuery.of(context)!.size.height * 0.17,
              decoration: BoxDecoration(
                color: Color(0xFF002366), // dark blue
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 35),
              child: Text(
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
          top: MediaQuery.of(context)!.size.height * 0.09,
          left: 0,
          right: 0,
          child: Column(
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context)!.size.height * 0.075,
                backgroundImage: NetworkImage("https://i.imgur.com/BoN9kdC.png"),
              ),
              SizedBox(height: 4,),
              Text(
                "محمد عبد العزيز محمود بسيوني",
                style: TextStyle(fontSize: FontSizes.FONT_SIZE_16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // Notification icon in orange curved corner
        Positioned(
          top: 0,
          right: 0,
          child: ClipPath(
            clipper: CornerClipper(),
            child: Container(
              width: 60,
              height: 60,
              color: Colors.orange,
              child: Center(
                child: Icon(Icons.notifications, color: Colors.white),
              ),
            ),
          ),
        ),

        // Profile picture and name
      ],
    );
  }
  Widget _buildGridMenu() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: menuItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.9,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Container(
            decoration: BoxDecoration(
              color: item.isSelected ? Colors.orange.shade100 : Colors.white,
              border: Border.all(color: Colors.orange, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              onTap: () {
                if(index == 0){
                  Navigator.push(context, PageTransition(child: const PersonalDataScreen(), type: PageTransitionType.leftToRight));
                }
                else if(index == 1){
                  Navigator.push(context, PageTransition(child: const EmploymentDetailsScreen(), type: PageTransitionType.leftToRight));

                }else if(index == 2){
                  Navigator.push(context, PageTransition(child: const AttendanceScreen(), type: PageTransitionType.leftToRight));

                }else if(index == 3){
                  Navigator.push(context, PageTransition(child:  RequestHolidayScreen(), type: PageTransitionType.leftToRight));

                }else if(index == 4){
                  Navigator.push(context, PageTransition(child:   const RevealingRanksScreen(), type: PageTransitionType.leftToRight));

                }
                else if(index == 5){
                  Navigator.push(context, PageTransition(child:  const RegisterAttendanceScreen(), type: PageTransitionType.leftToRight));

                }else{
                  Navigator.push(context, PageTransition(child:  RequestAdvanceScreen(), type: PageTransitionType.leftToRight));

                }

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item.icon, color: Colors.orange),
                  SizedBox(height: 10),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black),
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
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout, color: Colors.black),
          SizedBox(width: 5),
          Text("خروج", style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
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
      Offset(0, 0),
      radius: Radius.circular(60),
      clockwise: false,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}