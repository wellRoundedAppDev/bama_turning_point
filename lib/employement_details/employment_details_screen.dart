import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/constants/paths/image_paths.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmploymentDetailsScreen extends StatefulWidget {
  const EmploymentDetailsScreen({super.key});

  @override
  State<EmploymentDetailsScreen> createState() =>
      _EmploymentDetailsScreenState();
}

class _EmploymentDetailsScreenState extends State<EmploymentDetailsScreen> {
  final List<Map<String, String>> functionalData = [
    {
      'label': 'المسمى الوظيفي',
      'value': ' عامة',
    },
    {
      'label': 'الرقم الوظيفي',
      'value': '1977678',
    },
    {
      'label': 'تاريخ المباشرة',
      'value': '3 - 9 - 2010',
    },
    {
      'label': 'درجة الوظيفة',
      'value': 'lll',
    },
    {
      'label': 'المرحلة',
      'value': 'jj',
    },
    {
      'label': 'تاريخ منح الدرجة',
      'value': 'hjhj',
    },
    {
      'label': 'المنصب',
      'value': 'hhj', // Empty based on your content
    },
  ];

  @override
  void initState() {
    super.initState();
    //_tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: MediaQuery.of(context)!.size.height * 0.3,
          flexibleSpace: Stack(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.APP_LIGHT_MAIN_COLOR,
                height:MediaQuery.of(context)!.size.height * 0.32,
              ),
              Builder(
                  builder: (context) {
                    return Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context)!.size.height * 0.18,
                          decoration:  BoxDecoration(
                            color: AppColors.APP_SECONDARY_COLOR, // dark blue
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                          ),
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(top: 40),
                          child:  const Text(
                            "البيانات الوظيفية",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizes.FONT_SIZE_16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),


                        const Positioned(
                            top: 45,
                            right: 16,
                            child:
                            Icon(Icons.notifications,color: Colors.white,)
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
                        Positioned(
                            top: 45,
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
                top: MediaQuery.of(context)!.size.height * 0.092,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context)!.size.height * 0.075,
                      backgroundImage:
                          const NetworkImage("https://i.imgur.com/BoN9kdC.png"),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "محمد عبد العزيز محمود بسيوني",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Positioned(
                  top: 45,
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
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  ...functionalData.map((data) => _buildDataRow(data)).toList()
                ],
              ),
            ),


            Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(ImagePaths.GREY_CURVY_DECORATION)),

            Positioned(
              bottom: 24,
              right: 24,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImagePaths.LOG_OUT_ICON,),
                  const SizedBox(width: 5),
                  Text(AppLocalizations.of(context)!.log_out, style: const TextStyle(fontSize: FontSizes.FONT_SIZE_16)),
                ],
              ),
            )
          ],
        ));
  }
}

Widget _buildDataRow(Map<String, String> data) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            data['label']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontSizes.FONT_SIZE_14,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            data['value']!,
            textAlign: TextAlign.end,
            style: const TextStyle(
              fontSize: FontSizes.FONT_SIZE_14,
            ),
          ),
        ),
      ],
    ),
  );
}
