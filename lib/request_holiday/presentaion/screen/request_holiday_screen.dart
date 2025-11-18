import 'package:classic_eccomerce/request_holiday/presentaion/cubit/request_holiday_cubit.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/locales/l10n/app_localizations.dart';
import '../../../shared_components/appbar_container.dart';
import '../../../shared_components/yellow_curve.dart';

class RequestHolidayScreen extends StatelessWidget {
  RequestHolidayScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
  create: (context) => RequestHolidayCubit(),
  child: BlocConsumer<RequestHolidayCubit, RequestHolidayState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=RequestHolidayCubit.get(context);
    return SingleChildScrollView(
      child: Column(
          children: [
            AppbarContainer(
              title: AppLocalizations.of(context)!.request_holiday,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.holiday_type),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: cubit.selectedType,
                        hint:  Text(AppLocalizations.of(context)!.select_holiday_type,                                    style: TextStyle(color: Color(0xff878787),fontSize: FontSizes.FONT_SIZE_16,fontWeight: FontWeight.w300),
                        ),
                        isExpanded: true,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        items: cubit.holidayTypes
                            .map((type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ))
                            .toList(),
                        onChanged: (value) {cubit.selectHolidayType(value);},
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.from_date),
                            GestureDetector(
                              onTap: () {
                                cubit.pickDate(context,true);
      
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today_outlined,
                                        size: 18),
                                    const SizedBox(width: 8),
                                    Text(
                                      cubit.fromDate != null
                                          ? '${cubit.fromDate!.year}/${cubit.fromDate!.month}/${cubit.fromDate!.day}'
                                          : AppLocalizations.of(context)!.select_date,
                                      style: TextStyle(color: Color(0xff878787),fontSize: FontSizes.FONT_SIZE_16,fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)!.to_date),
                            GestureDetector(
                              onTap: () {
                                 cubit.pickDate(context,false);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                margin: const EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today_outlined,
                                        size: 18),
                                    const SizedBox(width: 8),
                                    Text(
                                      cubit.toDate != null
                                          ? '${cubit.toDate!.year}/${cubit.toDate!.month}/${cubit.toDate!.day}'
                                          : AppLocalizations.of(context)!.select_date,
                                      style: TextStyle(color: Color(0xff878787),fontSize: FontSizes.FONT_SIZE_16,fontWeight: FontWeight.w300),
      
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.reason),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomInput(controller: cubit.reasonController,filledColor:Colors.grey[100],hintText: AppLocalizations.of(context)!.enter_reason_here,maxLines: 3,),
                  SizedBox(height: 50,),
                  SizedBox(
                    height: 50,
                    child: CustomButton(
                      text: AppLocalizations.of(context)!.save,
                      action: () {cubit.save();},
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
    );
  },
),
),
    );
  }
}
