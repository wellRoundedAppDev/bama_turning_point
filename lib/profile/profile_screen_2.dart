import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



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
        toolbarHeight: MediaQuery.of(context)!.size.height * 0.3,
        flexibleSpace:  Stack(
          children: [
            Container(
              width: double.infinity,
              color: AppColors.APP_LIGHT_MAIN_COLOR,
              height:MediaQuery.of(context)!.size.height * 0.32,
            ),

            Builder(
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context)!.size.height * 0.18,
                    decoration:  BoxDecoration(
                      color: AppColors.APP_SECONDARY_COLOR, // dark blue
                      borderRadius: const BorderRadius.only(
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
              top: MediaQuery.of(context)!.size.height * 0.092,
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
        ),
        bottom: TabBar(

          controller: _tabController,
          tabs: const [
            Tab(text: 'البيانات الشخصية'),
            Tab(text: 'البيانات المكانية'),
            Tab(text: 'بيانات الاتصال'),
          ],
          labelStyle: const TextStyle(fontWeight: FontWeight.bold,color: AppColors.APP_MAIN_COLOR),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
          indicatorColor: AppColors.APP_MAIN_COLOR,


          indicatorWeight: 3,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Personal Data
          _buildPersonalDataTab(),

          // Tab 2: Equivalent Data
          _buildEquivalentDataTab(),

          // Tab 3: Contact Data
          _buildContactDataTab(),
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
          _buildDataRow('الاسم بالكامل', 'محمد عبد العزيز محمد بسيهان'),
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