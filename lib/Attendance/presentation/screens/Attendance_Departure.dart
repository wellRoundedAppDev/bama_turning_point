import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/report_last_month/presentaion/screens/report_last_month_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_components/yellow_curve.dart';
import '../widgets/show_model_sheet.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        const Icon(Icons.logout, size: 24),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          AppLocalizations.of(context)!.logout,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            BigAppbar(title: AppLocalizations.of(context)!
                .attendance_and_departure,size: size,column: Column(children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(
                    "assets/avatar.png"), // Replace with actual image
              ),
              const SizedBox(height: 12),
              Text(
                "محمد عبد العزيز محمود بسيوني",
                style: GoogleFonts.cairo(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "03 MAR 2025",
                style: TextStyle(
                  color: AppColors.APP_MAIN_COLOR,
                  fontSize: 16,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "08:00:00 AM",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 3,
                  fontSize: 22,
                ),
              ),
            ],),),

            // Body content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.today_attendance,
                        style: GoogleFonts.cairo(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReportLastMonthScreen(),));
                        },
                        child: Text(
                          AppLocalizations.of(context)!.last_month_report,
                          style: GoogleFonts.cairo(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Row 1: دخول / خروج
                  Row(
                    children: [
                      Expanded(
                          child: _timeCard(AppLocalizations.of(context)!.login,
                              "08:00 AM", Icons.login,() {
                              showRegistrationSuccessSheet(context, "08:00");
                              },)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _timeCard(
                              AppLocalizations.of(context)!.log_out,
                              "05:00 PM",
                              Icons.logout,() {

                              },)),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Row 2: ساعات العمل / الاستراحة
                  Row(
                    children: [
                      Expanded(
                          child: _timeCard(
                              AppLocalizations.of(context)!.working_hours,
                              "07:30 H",
                              Icons.access_time,() {

                          },)),
                      const SizedBox(width: 10),
                      Expanded(
                          child: _timeCard(
                              AppLocalizations.of(context)!.break_time,
                              "30:00 MIN",
                              Icons.coffee,() {
                          })),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // Save button
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.APP_MAIN_COLOR,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        AppLocalizations.of(context)!.save,
                        style: GoogleFonts.cairo(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _timeCard(String title, String time, IconData icon,VoidCallback  function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange.shade200),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: AppColors.APP_MAIN_COLOR),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigAppbar extends StatelessWidget {
   BigAppbar({
    super.key,
    required this.size,
    required this.column,
     required this.title,
     this.height=320
  });

  final Size size;
  final String title;
  final Widget column;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration:  BoxDecoration(
        color: AppColors.APP_SECONDARY_COLOR, // Dark blue
        borderRadius:const BorderRadius.only(
          bottomLeft:const Radius.circular(40),
          bottomRight:const Radius.circular(40),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.only(topRight: Radius.circular(30)),
                child: ClipPath(
                  clipper: YellowCurveClipper(),
                  child: Container(
                    width: 60,
                    height: size.height * .38,
                    color: AppColors.APP_MAIN_COLOR,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 40, left: 5, right: 5),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                        ),
                      ),
                      Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  column
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


