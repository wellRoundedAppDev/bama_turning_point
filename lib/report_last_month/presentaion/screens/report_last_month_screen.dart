
import 'package:classic_eccomerce/Attendance/presentation/screens/Attendance_Departure.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/locales/l10n/app_localizations.dart';

class ReportLastMonthScreen extends StatelessWidget {

   ReportLastMonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime previousMonthStart = DateTime(now.year, now.month - 1, 1);
    final DateTime previousMonthEnd = DateTime(now.year, now.month, 0);
    DateTime selectedValue = previousMonthStart;
    return  Scaffold(
      body: Column(
        children: [
          BigAppbar(title: AppLocalizations.of(context)!
              .last_month_report,height:250 ,size: MediaQuery.of(context).size, column: Column(
            children: [
              Text("March 2025",style: TextStyle(color: AppColors.APP_MAIN_COLOR,fontSize: 20,fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              TableCalendar(
                firstDay: previousMonthStart,
                lastDay: previousMonthEnd,
                focusedDay: selectedValue, // تأكد selectedValue داخل الشهر السابق
                calendarFormat: CalendarFormat.week,
                selectedDayPredicate: (day) => isSameDay(day, selectedValue),
                rowHeight: 80,
                daysOfWeekHeight: 40,
                headerVisible: false,
                daysOfWeekVisible: false,

                onDaySelected: (selectedDay, focusedDay) {
                    selectedValue = selectedDay;
                },

                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                ),

                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    return _buildDayCard(day, Colors.white, Colors.black);
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return _buildDayCard(day, Colors.orangeAccent, Colors.white);
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return _buildDayCard(day, AppColors.APP_MAIN_COLOR, Colors.white);
                  },
                ),
              ),
            ],
          )),
          Expanded(child: ListView.builder(itemCount: 5,itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            decoration: BoxDecoration(
              color: Color(0xfff2f2f2),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Date Section
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white, // Light grey background for date
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Text(
                        '01',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'MAR',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Text(
                        AppLocalizations.of(context)!
                            .attendance,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,

                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '05 : 00 PM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
                // Arrival Section
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      Text(
                        AppLocalizations.of(context)!
                            .departure,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '08 : 00 AM',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),))
        ],
      ),
    );
  }
}

Widget _buildDayCard(DateTime day, Color bgColor, Color textColor) {
  final String weekday = DateFormat.E().format(day); // Mon, Tue...
  final String dayNum = day.day.toString();

  return Container(
    margin: const EdgeInsets.all(6),
    width: 100,
    height: 120,
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(color: Colors.black12, blurRadius: 3),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weekday,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          dayNum,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ],
    ),
  );
}