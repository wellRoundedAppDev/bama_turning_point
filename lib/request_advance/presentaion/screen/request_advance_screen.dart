import 'package:classic_eccomerce/request_advance/presentaion/cubit/request_advance_cubit.dart';
import 'package:classic_eccomerce/request_holiday/presentaion/cubit/request_holiday_cubit.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';
import '../../../shared_components/appbar_container.dart';
import '../../../shared_components/yellow_curve.dart';

class RequestAdvanceScreen extends StatelessWidget {
  RequestAdvanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
  create: (context) => RequestAdvanceCubit(),
  child: BlocConsumer<RequestAdvanceCubit, RequestAdvanceState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit=RequestAdvanceCubit.get(context);
    return SingleChildScrollView(
      child: Column(
          children: [
            AppbarContainer(
              title: AppLocalizations.of(context)!.request_advance,
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
                      Text(AppLocalizations.of(context)!.cost),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomInput(controller: cubit.priceController,filledColor:Colors.grey[100],),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.date),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
              GestureDetector(
                onTap: () {
                  cubit.pickDate(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        cubit.date != null
                            ? '${cubit.date!.year}/${cubit.date!.month}/${cubit.date!.day}'
                            : AppLocalizations.of(context)!.select_date,
                        style: TextStyle(color: Color(0xff878787),fontSize: FontSizes.FONT_SIZE_16,fontWeight: FontWeight.w300),

                      ),
                      Spacer(),
                      const Icon(Icons.calendar_today_outlined,
                          size: 18),
                    ],
                  ),
                )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.installments_count),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomInput(controller: cubit.installmentsController,filledColor:Colors.grey[100],),

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
