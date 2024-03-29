// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/dummyData/all_dummy_data.dart';
import '../../../constants/size_configurations.dart';

class NotificationsContent extends StatefulWidget {
  const NotificationsContent({super.key});

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getPropWidth(16), vertical: getPropHeight(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 3),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: demoNotifications.length,
                itemBuilder: (context, index) {
                  return NotificationsCard(
                      date: demoNotifications[index].date,
                      time: demoNotifications[index].time,
                      messages: demoNotifications[index].message,
                      press: () {});
                }),
            const SizedBox(height: 2)
          ],
        ),
      ),
    );
  }
}

class NotificationsCard extends StatelessWidget {
  const NotificationsCard(
      {super.key,
      required this.date,
      required this.time,
      required this.messages,
      required this.press});

  final String date, time, messages;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        color: bgColor,
        elevation: 0,
        child: SizedBox(
          width: SizeConfig.screenWidth - 32,
          height: getPropHeight(80),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: getPropHeight(6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.5),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: primaryColor.withOpacity(0.5),
                        fontFamily: 'Lato',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: getPropHeight(5)),
                Text(
                  messages,
                  maxLines: 2,
                  style: const TextStyle(
                    color: regularTextColor,
                    fontFamily: 'Lato',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
