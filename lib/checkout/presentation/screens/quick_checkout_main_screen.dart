import 'package:classic_eccomerce/cart/presentation/cubits/cart_cubit/cubit.dart';
import 'package:classic_eccomerce/checkout/data/models/get_payment_methods_response.dart';
import 'package:classic_eccomerce/checkout/data/models/get_shipping_methods_response.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/check_out_cubit.dart';
import 'package:classic_eccomerce/checkout/presentation/cubits/states.dart';
import 'package:classic_eccomerce/core/constants/fonts/font_sizes.dart';
import 'package:classic_eccomerce/core/constants/paths/icon_paths.dart';
import 'package:classic_eccomerce/shared_components/custom_app_bar.dart';
import 'package:classic_eccomerce/shared_components/custom_button.dart';
import 'package:classic_eccomerce/shared_components/custom_input.dart';
import 'package:classic_eccomerce/shared_components/no_network_refresh_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuickCheckoutMainScreen extends StatefulWidget {
  const QuickCheckoutMainScreen({super.key});

  @override
  State<QuickCheckoutMainScreen> createState() =>
      _QuickCheckoutMainScreenState();
}

class _QuickCheckoutMainScreenState extends State<QuickCheckoutMainScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutCubit, CheckOutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CheckOutCubit checkOutCubit = CheckOutCubit.get(context);
        List<ShippingMethod>? shippingMethods = checkOutCubit.shippingMethods;
        List<PaymentMethod>? paymentMethods = checkOutCubit.paymentMethods;

        ShippingMethod? selectedShippingMethod =
            checkOutCubit.selectedShippingMethod;
        PaymentMethod? selectedPaymentMethod =
            checkOutCubit.selectedPaymentMethod;

        return SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar.renderAppBar(
              title: "Quick Checkout", showCartIcon: false),
          body: (state is InitializeCheckoutLoadingState)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : (state is InitializeCheckoutNetworkConnectionFailedState)
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: NoNetworkRefreshPage(refresh: () {
                          checkOutCubit.init();
                        }),
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration:
                                  const BoxDecoration(color: Color(0xffF5F5F5)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    IconPaths.SHIPPING,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "SHIPPING METHOD",
                                            style: TextStyle(
                                                color: Color(0xff1E1B1B),
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    FontSizes.FONT_SIZE_20),
                                          ),
                                        ),
                                        ...List.generate(
                                            shippingMethods?.length ?? 0,
                                            (index) {
                                          var shippingMethod =
                                              shippingMethods?[index];
                                          String? shippingMethodName =
                                              shippingMethod?.quote?[0].title;
                                          double? shippingMethodCost =
                                              double.tryParse(shippingMethod
                                                      ?.quote?[0].cost ??
                                                  "");
                                          if (kDebugMode) {
                                            print(shippingMethodCost);
                                          }
                                          return RadioListTile(
                                            value: index,
                                            groupValue: 0,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            dense: true,
                                            onChanged: (index) {
                                              checkOutCubit
                                                  .setShippingMethod(index!);
                                            },
                                            title: Text(
                                              "${shippingMethodName ?? "-"} - \$${shippingMethodCost.toString() ?? "-"}",
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_16),
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration:
                                  const BoxDecoration(color: Color(0xffF5F5F5)),
                              child: Row(
                                children: [
                                  Image.asset(
                                    IconPaths.CASH,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            "PAYMENT METHOD",
                                            style: TextStyle(
                                                color: Color(0xff1E1B1B),
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    FontSizes.FONT_SIZE_20),
                                          ),
                                        ),
                                        ...List.generate(
                                            paymentMethods?.length ?? 0,
                                            (index) {
                                          var paymentMethod =
                                              paymentMethods?[index];
                                          String? paymentMethodName =
                                              paymentMethod?.title;

                                          return RadioListTile(
                                            value: index,
                                            groupValue: 0,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            dense: true,
                                            onChanged: (index) {
                                              checkOutCubit
                                                  .setPaymentMethod(index!);
                                            },
                                            title: Text(
                                              "${paymentMethodName ?? "-"} ",
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize:
                                                      FontSizes.FONT_SIZE_16),
                                            ),
                                          );
                                        })
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffDDDDDD),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Coupon / Reward",
                                    style: TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    "Enter your coupon here",
                                    style: TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff878787)),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: CustomInput()),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                          width: 100,
                                          child: CustomButton(
                                              text: "Submit", action: () {}))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Text(
                                    "Enter your gift certificate code here",
                                    style: TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_16,
                                        color: Color(0xff878787)),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(child: CustomInput()),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                          width: 100,
                                          child: CustomButton(
                                              text: "Submit", action: () {}))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              "SHOPPING CART",
                              style: TextStyle(
                                fontSize: FontSizes.FONT_SIZE_20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 5,
                                  color: const Color(0xffB6BBC6),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Sub-Total:",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "\$${CartCubit.get(context).totalPrice}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: const Color(0xffB6BBC6),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${selectedShippingMethod?.quote?[0].title ?? ""}:",
                                          style: const TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "\$${selectedShippingMethod?.quote?[0].cost ?? ""}",
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: const Color(0xffB6BBC6),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Total:",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "\$${CartCubit.get(context).totalPrice + (double.tryParse(selectedShippingMethod?.quote?[0].cost ?? "") ?? 0)} ",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            style: const TextStyle(
                                                fontSize:
                                                    FontSizes.FONT_SIZE_14),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffDDDDDD),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Add Comments About Your Order",
                                    style: TextStyle(
                                        fontSize: FontSizes.FONT_SIZE_20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomInput(
                                    hintText: "",
                                    minLines: 4,
                                    maxLines: null,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CheckboxListTile(
                                        value: true,
                                        onChanged: (check) {},

                                        title: const Text(
                                          "I have read and agree to the Terms & Conditions",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: CheckboxListTile(
                                        value: true,
                                        onChanged: (check) {},
                                        title: const Text(
                                          "I have read and agree to the Privacy Policy",
                                          style: TextStyle(
                                              fontSize: FontSizes.FONT_SIZE_14),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomButton(
                                text: "Confirm Order",
                                isLoading: state is ConfirmOrderLoadingState,
                                action: () {
                                  checkOutCubit.confirmOrder(CartCubit.get(context));
                                  // Navigator.push(
                                  //     context,
                                  //     PageTransition(
                                  //         child: const OrderSuccessScreen(),
                                  //         type: PageTransitionType.leftToRight));
                                }),
                            const SizedBox(
                              height: 8,
                            )
                          ],
                        ),
                      ),
                    ),
        ));
      },
    );
  }
}
