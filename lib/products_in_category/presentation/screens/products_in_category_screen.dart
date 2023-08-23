import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/fonts/font_sizes.dart';

class ProductsInCategoryScreen extends StatelessWidget {
  const ProductsInCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(

      appBar: AppBar(
        leading: Container(),
        toolbarHeight: MediaQuery.of(context).size.height * 0.08,
        flexibleSpace: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(
              child: Text(
               "ملابس",
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: FontSizes.FONT_SIZE_22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),),
      body:  Padding(padding: const EdgeInsets.all(16),
      child:  GridView.builder(
        shrinkWrap: true,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 230,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
        ),
        itemCount: 15,
        itemBuilder:
            (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    12),
                border: Border.all(
                    color: const Color(
                        0xffA3A3A3))
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/shirt.jpg",
                  height: 100,
                  fit: BoxFit.cover,
                  width:
                  MediaQuery.of(context)
                      .size
                      .width,
                  errorBuilder: (context,
                      object, stackTrace) {
                    return const Icon(
                      Icons.image,
                      size: 150,
                      color: AppColors
                          .APP_MAIN_COLOR,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("ملابس",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: FontSizes.FONT_SIZE_14,
                      ),),

                      const Text("44 SAR"),
                      const SizedBox(height: 20,),
                      CustomButton(text: "إضافة الى السلة",textFontSize: FontSizes.FONT_SIZE_12, action: (){},

                        height: 32,),
                    ],
                  ),
                )

              ],
            ),
          );
        },
      )
      ),
    ));
  }
}
