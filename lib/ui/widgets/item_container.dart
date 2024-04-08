import 'package:flutter/material.dart';
import 'package:phone_pe_demo/core/constants/color_constants.dart';
import 'package:phone_pe_demo/core/constants/string_constants.dart';

class ItemContainer extends StatelessWidget {
  const ItemContainer(
      {super.key, required this.itemName, required this.itemImage});
  final String itemName;
  final String itemImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ColorConstants.whiteFAFAFA,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              blurRadius: 12,
              spreadRadius: 1,
              color: ColorConstants.grey,
              offset: Offset(0, 4))
        ],
      ),
      child: Row(
        children: [
          Container(
              height: 110,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                itemImage,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(StringConstants.limitedStock,
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.grey,
                        fontStyle: FontStyle.italic)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      StringConstants.rupees100,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.remove)),
                        const Text(
                          "1",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
