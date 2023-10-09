import 'package:classic_eccomerce/account/data/models/get_account_addresses_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/constants/fonts/font_sizes.dart';
import '../../../../shared_components/custom_button.dart';
import '../address_book_entries/edit_address_screen.dart';

class AddressEntryItem extends StatelessWidget {

  AccountAddress? address;
  AddressEntryItem({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
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
                        "Full Name : ",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          "${address?.firstname ?? ""} ${address?.lastname ?? ""}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Address : ",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          address?.address1 ?? "-",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
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
                        "Post Code : ",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          address?.postcode ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
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
                        "City : ",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          address?.city ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
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
                        "Country : ",
                        style: TextStyle(
                            fontSize: FontSizes.FONT_SIZE_14,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          address?.country ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              const TextStyle(fontSize: FontSizes.FONT_SIZE_14),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 35,
                  child: CustomButton(
                    text: "Edit",
                    action: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const EditAddressScreen(),
                              type: PageTransitionType.leftToRight));
                    },
                    color: const Color(0xff313846),
                  )),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                height: 35,
                child: CustomButton(text: "Delete", action: () {}),
              )
            ],
          ),
        )
      ],
    );
  }
}
