import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/fonts/font_sizes.dart';
import '../../../core/constants/paths/icon_paths.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        bottomNavigationBar: SizedBox(
          height: 50,
          child: Column(
            children: [
              Container(
                height: 2,
                color: const Color(0xffE5E5E5),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   Image.asset(IconPaths.TRASH,width: 22,height: 22,),
                    const SizedBox(
                      width: 16,
                    ),
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: CustomButton(text: "Done", action: () {}),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(top: 32.0, right: 16, left: 16, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.clear,
                      color: Color(0xff697285),
                      size: 20,
                    ),
                    Spacer(),
                    Center(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_16,
                          color: Color(
                            0xff313846,
                          ),
                        ),
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
              Container(
                height: 2,
                color: const Color(0xffE5E5E5),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                          fontSize: FontSizes.FONT_SIZE_16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff313846)),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xff313846),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Slider(
                value: 1,
                max: 100,
                activeColor: const Color(0xff015963),
                inactiveColor: const Color(0xffE1E1E1),
                // label: _currentSliderValue.round().toString(),
                onChanged: (double value) {},
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.arrow_drop_up),
                        SizedBox(
                            height: 25,
                            width: 60,
                            child: CustomInput(
                              hintTextStyle:
                                  const TextStyle(color: Color(0xff313846)),
                              radius: 0,
                              borderColor: const Color(0xffDDDDDD),
                              borderWidth: 1,
                            )),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.arrow_drop_up),
                        SizedBox(
                            height: 25,
                            width: 60,
                            child: CustomInput(
                              hintTextStyle:
                                  const TextStyle(color: Color(0xff313846)),
                              radius: 0,
                              borderColor: const Color(0xffDDDDDD),
                              borderWidth: 1,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 2,
                color: const Color(0xffE5E5E5),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Color",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff313846)),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff313846),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffDDDDDD), width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: const Color(0xff557855),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "green",
                                style: TextStyle(
                                    color: Color(0xff313846),
                                    fontSize: FontSizes.FONT_SIZE_12),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffDDDDDD), width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: const Color(0xffC37CE5),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Purple",
                                style: TextStyle(
                                    color: Color(0xff313846),
                                    fontSize: FontSizes.FONT_SIZE_12),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xffDDDDDD), width: 2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: const Color(0xffDE9C4F),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Orange",
                                style: TextStyle(
                                    color: Color(0xff313846),
                                    fontSize: FontSizes.FONT_SIZE_12),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 2,
                color: const Color(0xffE5E5E5),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Availability",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff313846)),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff313846),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff878787),
                            value: false,
                            onChanged: (isCheck) {}),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "in Stock",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff878787)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff015963),
                            value: true,
                            onChanged: (isCheck) {}),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "out Stock",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff015963)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: 2,
                color: const Color(0xffE5E5E5),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Size",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff313846)),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xff313846),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff015963),
                            value: true,
                            onChanged: (isCheck) {}),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "xs",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff015963)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff015963),
                            value: false,
                            onChanged: (isCheck) {}),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "sm",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff015963)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff015963),
                            value: true,
                            onChanged: (isCheck) {}),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "lg",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff015963)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff015963),
                            value: false,
                            onChanged: (isCheck) {}),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "xl",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff015963)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff015963),
                            value: false,
                            onChanged: (isCheck) {}),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          "xxl",
                          style: TextStyle(
                              fontSize: FontSizes.FONT_SIZE_16,
                              color: Color(0xff015963)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
