import 'package:classic_eccomerce/authentication/presentation/auth_cubit/states.dart';
import 'package:classic_eccomerce/authentication/presentation/screens/login_screen.dart';
import 'package:classic_eccomerce/core/constants/colors/colors.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/used/presentation/screens/add_used_product_by_client_screen.dart';
import 'package:classic_eccomerce/used/presentation/screens/used_products_by_client_screen.dart';
import 'package:classic_eccomerce/used/presentation/screens/used_products_by_company_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../authentication/presentation/auth_cubit/auth_cubit.dart';
import '../../../core/constants/paths/image_paths.dart';

class UsedSectionMainScreen extends StatelessWidget {
  bool showBackButton;
  UsedSectionMainScreen({Key? key, this.showBackButton = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: CustomAppBar.renderAppBar(
                title: "", showBackButton: showBackButton, showCartIcon: false),
            bottomNavigationBar: Stack(
              children: [
                Container(height: 100,color: Colors.transparent,),
                Positioned(
                  right: 50,
                  top: 16,
                  child: Container(
                    padding: EdgeInsets.only(right: 35,left: 40,top: 8,bottom: 8),
                    decoration: BoxDecoration(
                    
                    
                    color: Color(0xffDBD6D6),

                    borderRadius: BorderRadius.circular(20),

                  ),
                    child: Text("اضف دراجتك",style: TextStyle(fontSize: FontSizes.FONT_SIZE_12,fontWeight: FontWeight.w500),),
                  ),
                ),

                Positioned(
                  top: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const AddUsedProductByClientScreen(),
                              type: PageTransitionType.leftToRight));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 32, right: 16),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.APP_MAIN_COLOR,
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: BlocConsumer<AuthCubit, AuthStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      ClipOval(
                          child: Image.asset(
                        ImagePaths.APP_LOGO,
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.2,
                      )),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child:
                                            const UsedProductsByCompanyScreen(),
                                        type: PageTransitionType.leftToRight));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: const BoxDecoration(
                                  color: AppColors.APP_MAIN_COLOR,
                                ),
                                child: const Text(
                                  "من الشركة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSizes.FONT_SIZE_15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            )),
                            const SizedBox(
                              width: 24,
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child:
                                            const UsedProductsByClientScreen(),
                                        type: PageTransitionType.leftToRight));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: const BoxDecoration(
                                  color: AppColors.APP_MAIN_COLOR,
                                ),
                                child: const Text(
                                  "من الزبائن",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSizes.FONT_SIZE_15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                      Spacer()
                    ],
                  );
                })));
  }
}
