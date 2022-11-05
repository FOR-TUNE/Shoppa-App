import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/screens/login/loginContent/loginForm.dart';
import '../../../components/socialCard.dart';
import '../../../constants/constants.dart';
import '../../../constants/size_configurations.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getPropWidth(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getPropHeight(27),
                ),
                Text("Login", style: headerStyle2),
                SizedBox(
                  height: getPropHeight(49),
                ),
                const LoginForm(),
                SizedBox(
                  height: getPropHeight(73),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Or Sign In with",
                      style: subHeaderStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: getPropHeight(16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    SocialCard(
                      icon: "assets/icons/facebook.svg",
                    ),
                    SocialCard(
                      icon: "assets/icons/google.svg",
                    ),
                    SocialCard(
                      icon: "assets/icons/instagram.svg",
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}