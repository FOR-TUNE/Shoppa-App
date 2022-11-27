// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/screens/createOrder/createOrderScreen.dart';
import 'package:shoppa_app/screens/orders/components/ordersHistory.dart';

import '../../../constants/constants.dart';

class OrdersScreenContent extends StatefulWidget {
  const OrdersScreenContent({super.key});

  @override
  State<OrdersScreenContent> createState() => _OrdersScreenContentState();
}

class _OrdersScreenContentState extends State<OrdersScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getPropHeight(25)),
            const CreateOrderWidget(),
            SizedBox(height: getPropHeight(25)),
            const SearchField(),
            SizedBox(height: getPropHeight(25)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('History', style: headerStyle3),
                SizedBox(height: getPropHeight(5)),
                ListView.builder(
                    physics: const ScrollPhysics(),
                    itemCount: demoHistory.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return OrdersHistoryCard(
                          buyerName: demoHistory[index].buyerName,
                          goodsName: demoHistory[index].goodsName,
                          price: demoHistory[index].price,
                          inTransit: demoHistory[index].inTransit,
                          processing: demoHistory[index].processing,
                          notProcessed: demoHistory[index].notProcessed,
                          press: () {});
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CreateOrderWidget extends StatelessWidget {
  const CreateOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          width: SizeConfig.screenWidth - 32,
          height: getPropHeight(90),
          decoration: BoxDecoration(
              color: ordersCardColor, borderRadius: BorderRadius.circular(8)),
        ),
        Positioned(
            left: getPropWidth(32),
            top: getPropHeight(16),
            child: TextButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(CreateOrderScreen.routeName);
                },
                icon: const Icon(Icons.add, color: regularTextColor),
                label: Text("Create a new order",
                    style: TextStyle(
                        color: regularTextColor,
                        fontFamily: 'Lato',
                        fontSize: getPropHeight(16),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 2)))),
        Positioned(
            top: getPropHeight(20),
            left: getPropWidth(230),
            child: Image.asset('assets/images/orderCardImage.png'))
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth - 32,
      height: getPropHeight(56),
      decoration: BoxDecoration(
          border: Border.all(
              color: subHeaderTextColor.withOpacity(0.2),
              style: BorderStyle.solid,
              width: 1),
          color: bgColor,
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        onChanged: (value) {
          // search value
        },
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search Order",
            hintStyle: TextStyle(
                color: subHeaderTextColor.withOpacity(0.5),
                fontFamily: 'Lato',
                fontSize: getPropHeight(12),
                fontWeight: FontWeight.w400,
                letterSpacing: 2),
            prefixIcon: Icon(
              Icons.search_outlined,
              color: subHeaderTextColor.withOpacity(0.5),
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: getPropWidth(20), vertical: getPropWidth(9)),
            suffixIcon: Icon(
              Icons.filter_alt_outlined,
              color: subHeaderTextColor.withOpacity(0.5),
            )),
      ),
    );
  }
}

class OrdersHistoryCard extends StatelessWidget {
  const OrdersHistoryCard(
      {super.key,
      required this.buyerName,
      required this.goodsName,
      required this.price,
      required this.inTransit,
      required this.processing,
      required this.notProcessed,
      required this.press});

  final String buyerName, goodsName, price;
  final bool inTransit, processing, notProcessed;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: bgColor,
        elevation: 0,
        child: SizedBox(
          height: getPropHeight(75),
          width: SizeConfig.screenWidth - 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withOpacity(0.10),
                        ),
                        child: Center(
                          child: Text(
                            'OA',
                            style: TextStyle(
                              color: primaryColor,
                              fontFamily: 'Lato',
                              fontSize: getPropHeight(16),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )),
                    const SizedBox(
                      width: 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          buyerName,
                          style: TextStyle(
                            color: headerTextColor,
                            fontFamily: 'Manrope',
                            fontSize: getPropHeight(16),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '"Ordered for',
                          style: TextStyle(
                            color: regularTextColor.withOpacity(0.3),
                            fontFamily: 'Lato',
                            fontSize: getPropHeight(10),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          goodsName,
                          style: TextStyle(
                            color: regularTextColor.withOpacity(0.3),
                            fontFamily: 'Lato',
                            fontSize: getPropHeight(14),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("NGN $price", style: regTextStyle),
                        const SizedBox(width: 3),
                        const Icon(Icons.more_vert,
                            size: 16, color: regularTextColor)
                      ],
                    ),
                    if (inTransit == true)
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.10),
                              borderRadius:
                                  BorderRadius.circular(getPropWidth(06))),
                          child: Text(
                            'In-Transit',
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Lato',
                                fontSize: getPropHeight(10),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2),
                          )),
                    if (processing == true)
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFC107).withOpacity(0.10),
                              borderRadius:
                                  BorderRadius.circular(getPropWidth(06))),
                          child: Text(
                            'Processing',
                            style: TextStyle(
                                color: regularTextColor,
                                fontFamily: 'Lato',
                                fontSize: getPropHeight(10),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2),
                          )),
                    if (notProcessed == true)
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFCCCC).withOpacity(0.15),
                              borderRadius:
                                  BorderRadius.circular(getPropWidth(06))),
                          child: Text(
                            'Not Processed',
                            style: TextStyle(
                                color: const Color(0xFFDC3C3C),
                                fontFamily: 'Lato',
                                fontSize: getPropHeight(10),
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1.2),
                          )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}