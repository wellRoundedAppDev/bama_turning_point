import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/image_paths.dart';
import 'package:classic_eccomerce/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/locales/l10n/app_localizations.dart';



class PersonalDataScreen extends StatefulWidget {
  const PersonalDataScreen({super.key});

  @override
  State<PersonalDataScreen> createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context)!.size.height * 0.24,
        flexibleSpace:  Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.transparent,
              height:MediaQuery.of(context)!.size.height * 0.3,
            ),

            Builder(
                builder: (context) {
                  return Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        decoration:  BoxDecoration(
                          color: AppColors.APP_SECONDARY_COLOR, // dark blue
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        alignment: Alignment.topCenter,
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "البيانات الشخصية",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FontSizes.FONT_SIZE_16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),


                      // const Positioned(
                      //     top: 45,
                      //     right: 16,
                      //     child:
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
                      Positioned(
                          top: 50,
                          left: 16,
                          child:
                          GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_forward_ios,color: Colors.white,))
                        // ClipPath(
                        //   clipper: CornerClipper(),
                        //   child: Container(
                        //     width: 60,
                        //     height: 60,
                        //     color: Colors.orange,
                        //     child: Center(
                        //       child: Icon(Icons.notifications, color: Colors.white),
                        //     ),
                        //   ),
                        // ),
                      ),
                    ],
                  );
                }
            ),

            Positioned(
              top: MediaQuery.of(context).size.height * 0.12,
              left: 0,
              right: 0,
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(ImagePaths.APP_LOGO), // Replace with actual image
                  ),

                  SizedBox(height: 8,),
                  Text(
                    "محمد",
                    style: TextStyle(fontSize: FontSizes.FONT_SIZE_16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            // Notification icon in orange curved corner
            // Positioned(
            //   top: 0,
            //   right: 0,
            //   child:
            //     Image.asset(ImagePaths.ORANGE_CURVY_APPBAR_DECORATION)
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
        ),
        // bottom: TabBar(
        //
        //   controller: _tabController,
        //   tabs: const [
        //     Tab(text: 'البيانات الشخصية'),
        //     Tab(text: 'البيانات المكانية'),
        //     Tab(text: 'بيانات الاتصال'),
        //   ],
        //   labelStyle: const TextStyle(fontWeight: FontWeight.bold,color: AppColors.APP_MAIN_COLOR,
        //   fontSize: FontSizes.FONT_SIZE_12,
        //
        //   ),
        //   unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        //   indicatorColor: AppColors.APP_MAIN_COLOR,
        //
        //
        //   indicatorWeight: 3,
        // ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              // Tab 1: Personal Data
              _buildPersonalDataTab(),

              Text("2"),

              Text("3"),

              // Tab 2: Equivalent Data
              // _buildEquivalentDataTab(),
              //
              // // Tab 3: Contact Data
              // _buildContactDataTab(),
            ],
          ),

          Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset(ImagePaths.GREY_CURVY_DECORATION)),

          // Positioned(
          //   bottom: 24,
          //   right: 24,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(ImagePaths.LOG_OUT_ICON,),
          //       const SizedBox(width: 5),
          //       Text(AppLocalizations.of(context)!.log_out, style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16)),
          //     ],
          //   ),
          // )

        ],
      ),
    );
  }

  Widget _buildPersonalDataTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          const SizedBox(height: 8,),
          _buildDataRow('الاسم بالكامل', 'محمد'),
          const SizedBox(height: 16),
          _buildDataRow('تاريخ الميلاد', '٣٣ - ٥- ١٩٨٢'),
          const SizedBox(height: 16),
          _buildDataRow('اسم الام', 'عبير'),

          const SizedBox(height: 16),
          _buildDataRow('رقم البطاقة الموحدة', '222332222'),

          const SizedBox(height: 16),
          _buildDataRow('التحصيل الدراسي', 'تجارة'),

        ],
      ),
    );
  }

  Widget _buildEquivalentDataTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildDataRow('اسم الدم', 'عبير علام الدين محمود'),
        ],
      ),
    );
  }

  Widget _buildContactDataTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          _buildDataRow('رقم البطاقة الموحدة', 'VOA.VOEEOV9A'),
          const SizedBox(height: 16),
          _buildDataRow('التدريب الدراسي', 'بكالوريوس تجارة'),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      child: Row(
        children: [
        Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontSizes.FONT_SIZE_14,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: FontSizes.FONT_SIZE_14,
              ),
              textAlign: TextAlign.end,
            ),
          )],
      ),
    );
  }
}