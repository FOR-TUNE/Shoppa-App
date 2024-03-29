// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/constants.dart';
import 'package:shoppa_app/constants/size_configurations.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import 'package:shoppa_app/models/screenArguments.dart';
import 'package:shoppa_app/screens/order/createOrder/createOrderScreen.dart';
import 'package:shoppa_app/screens/order/orderDetails/orderDetailsScreen.dart';

class OrdersScreenContent extends StatefulWidget {
  const OrdersScreenContent({super.key});

  @override
  State<OrdersScreenContent> createState() => _OrdersScreenContentState();
}

class _OrdersScreenContentState extends State<OrdersScreenContent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getPropWidth(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getPropHeight(25)),
            const CreateOrderWidget(),
            // SizedBox(height: getPropHeight(25)),
            // const SearchField(),
            SizedBox(height: getPropHeight(25)),
            Text('History', style: headerStyle3),
            SizedBox(height: getPropHeight(10)),
            Expanded(
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: demoHistory.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return OrdersHistoryCard(
                      date: demoHistory[index].date,
                      buyerFirstName: demoHistory[index].buyerFirstName,
                      buyerLastName: demoHistory[index].buyerLastName,
                      goodsName: demoHistory[index].goodsName,
                      price: demoHistory[index].price,
                      inTransit: demoHistory[index].inProgress,
                      processing: demoHistory[index].cancelled,
                      notProcessed: demoHistory[index].completed,
                      press: () {
                        Navigator.pushNamed(
                          context,
                          OrderDetailsScreen.routeName,
                          arguments: OrderDetailsArguments(
                              buyerFirstName: demoHistory[index].buyerFirstName,
                              buyerLastName: demoHistory[index].buyerLastName,
                              goodsName: demoHistory[index].goodsName,
                              price: demoHistory[index].price,
                              date: demoHistory[index].date,
                              inTransit: demoHistory[index].inProgress,
                              processing: demoHistory[index].cancelled,
                              notProcessed: demoHistory[index].completed,
                              address: demoHistory[index].address),
                        );
                      },
                      press1: () {},
                    );
                  }),
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
          width: SizeConfig.screenWidth - 10,
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
                label: const Text("Create a new order",
                    style: TextStyle(
                      color: regularTextColor,
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )))),
        Positioned(
            top: getPropHeight(20),
            left: getPropWidth(250),
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
      width: SizeConfig.screenWidth - 10,
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
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
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
      required this.buyerFirstName,
      required this.buyerLastName,
      required this.goodsName,
      required this.price,
      required this.inTransit,
      required this.processing,
      required this.notProcessed,
      required this.press,
      required this.date,
      required this.press1});

  final String buyerFirstName, buyerLastName, goodsName, price, date;
  final bool inTransit, processing, notProcessed;
  final GestureTapCallback press, press1;

  @override
  Widget build(BuildContext context) {
    final List<String> dropdownitem = [
      'Change Order Status',
      'Track Order',
      'Share Order',
      'Cancel Order'
    ];

    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Card(
            color: bgColor,
            elevation: 0,
            child: SizedBox(
              height: getPropHeight(90),
              width: SizeConfig.screenWidth - 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
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
                                "${buyerFirstName.characters.characterAt(0)}${buyerLastName.characters.characterAt(0).toUpperCase()}",
                                style: const TextStyle(
                                  color: primaryColor,
                                  fontFamily: 'Lato',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
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
                              "$buyerFirstName $buyerLastName",
                              style: const TextStyle(
                                color: headerTextColor,
                                fontFamily: 'Manrope',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'Ordered for',
                              style: TextStyle(
                                color: regularTextColor.withOpacity(0.4),
                                fontFamily: 'Lato',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              goodsName,
                              style: const TextStyle(
                                color: regularTextColor,
                                fontFamily: 'Lato',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
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
                            Text(
                              "NGN $price",
                              style: const TextStyle(
                                color: headerTextColor,
                                fontFamily: 'Manrope',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            PopupMenuButton(
                              color: bgColor,
                              padding: EdgeInsets.only(
                                  left: getPropWidth(30),
                                  right: getPropWidth(10),
                                  top: getPropHeight(23)),
                              position: PopupMenuPosition.under,
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    value: dropdownitem[0],
                                    textStyle: regTextStyle,
                                    child: Text(dropdownitem[0]),
                                  ),
                                  PopupMenuItem(
                                    value: dropdownitem[1],
                                    textStyle: regTextStyle,
                                    child: Text(dropdownitem[1]),
                                  ),
                                  PopupMenuItem(
                                    value: dropdownitem[2],
                                    textStyle: regTextStyle,
                                    child: Text(dropdownitem[2]),
                                  ),
                                  PopupMenuItem(
                                    value: dropdownitem[3],
                                    textStyle: regTextStyle.copyWith(
                                        color: deleteIconColor),
                                    child: Text(dropdownitem[3]),
                                  )
                                ];
                              },
                              child: const Icon(
                                Icons.more_vert,
                                color: regularTextColor,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                        if (inTransit == true)
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                  color: primaryColor.withOpacity(0.10),
                                  borderRadius:
                                      BorderRadius.circular(getPropWidth(06))),
                              child: const Text(
                                'In-Transit',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: 'Lato',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.0),
                              )),
                        if (processing == true)
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFFFC107).withOpacity(0.10),
                                  borderRadius:
                                      BorderRadius.circular(getPropWidth(06))),
                              child: const Text(
                                'Processing',
                                style: TextStyle(
                                    color: regularTextColor,
                                    fontFamily: 'Lato',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.0),
                              )),
                        if (notProcessed == true)
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3),
                              decoration: BoxDecoration(
                                  color: deleteIconColor.withOpacity(0.15),
                                  borderRadius:
                                      BorderRadius.circular(getPropWidth(06))),
                              child: const Text(
                                'Not Processed',
                                style: TextStyle(
                                    color: deleteIconColor,
                                    fontFamily: 'Lato',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.0),
                              )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 2,
            width: SizeConfig.screenWidth - 20,
            color: regularTextColor.withOpacity(0.1),
          )
        ],
      ),
    );
  }
}
