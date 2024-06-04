import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:memra/constants/common_functions.dart';
import 'package:memra/controller/services/auth_services/auth_services.dart';
import 'package:memra/utils/colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = false;
  String currentCountryCode = '+1';
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: AssetImage('assets/images/memra.jpg'),
          height: height * 0.070,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: textTheme.displaySmall!
                      .copyWith(fontWeight: FontWeight.w600, color: indigo),
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                //SignIn(width, height, textTheme, context),
                //CreateAccount(width, height, textTheme, context),

                Builder(builder: (context) {
                  if (inLogin) {
                    return SignIn(width, height, textTheme, context);
                  }
                  return CreateAccount(width, height, textTheme, context);
                }),
                CommonFuctions.blankSpace(
                  height * 0.05,
                  0,
                ),
                const BottomAuthScreenWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container SignIn(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: indigo,
        ),
      ),
      child: Column(
        children: [
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: greyShade3),
              ),
              color: indigo, //greyShade1
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = false;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: white),
                        color: white),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? transparent : indigo,
                    ),
                  ),
                ),
                CommonFuctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Create Account. ',
                          style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold, color: white)),
                      TextSpan(
                          text: 'First time here? ',
                          style: textTheme.bodyMedium!.copyWith(color: white))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = true;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: indigo),
                            color: white),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: inLogin ? indigo : transparent,
                        ),
                      ),
                    ),
                    CommonFuctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Sign in. ',
                              style: textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'Have an account?',
                              style: textTheme.bodyMedium)
                        ],
                      ),
                    )
                  ],
                ),
                CommonFuctions.blankSpace(height * 0.01, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          color: white,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.66,
                      child: TextFormField(
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.displaySmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Mobile number',
                          hintStyle: textTheme.bodySmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: indigo,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFuctions.blankSpace(height * 0.02, 0),
                CommonAuthButton(
                  title: 'Continue',
                  onPressed: () {
                    AuthServices.receiveOTP(
                        context: context,
                        mobileNo:
                            '$currentCountryCode${mobileController.text.trim()}');
                  },
                  btnwidth: 0.88,
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing, you agree to Memra\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(color: indigo),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: ' Privacy Notice! Click <>',
                        style: textTheme.labelMedium!.copyWith(color: indigo),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container CreateAccount(
      double width, double height, TextTheme textTheme, BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: indigo,
        ),
      ),
      child: Column(
        children: [
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          inLogin = false;
                        });
                      },
                      child: Container(
                        height: height * 0.03,
                        width: height * 0.03,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: indigo),
                            color: white),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.circle,
                          size: height * 0.015,
                          color: inLogin ? transparent : indigo,
                        ),
                      ),
                    ),
                    CommonFuctions.blankSpace(
                      0,
                      width * 0.02,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Create Account. ',
                              style: textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'First time here?',
                              style: textTheme.bodyMedium)
                        ],
                      ),
                    )
                  ],
                ),
                CommonFuctions.blankSpace(
                  height * 0.01,
                  0,
                ),
                SizedBox(
                  height: height * 0.06,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'First and Last Name',
                      hintStyle: textTheme.bodySmall,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(
                          color: indigo,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            onSelect: (val) {
                              setState(() {
                                currentCountryCode = '+${val.phoneCode}';
                              });
                            });
                      },
                      child: Container(
                        height: height * 0.06,
                        width: width * 0.2,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: grey,
                          ),
                          color: white,
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                        ),
                        child: Text(
                          currentCountryCode,
                          style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    CommonFuctions.blankSpace(height * 0.08, 0),
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.66,
                      child: TextFormField(
                        controller: mobileController,
                        cursorColor: black,
                        style: textTheme.displaySmall,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Mobile number',
                          hintStyle: textTheme.bodySmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: indigo,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                Text(
                  'By enrolling your mobile phone number, you concern to recieve automated securrity notifications via text message from Memra.\nMessage and data rates may apply.',
                  style: textTheme.bodyMedium,
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                CommonAuthButton(
                  title: 'Continue',
                  btnwidth: 0.88,
                  onPressed: () {
                    AuthServices.receiveOTP(
                        context: context,
                        mobileNo:
                            '+$currentCountryCode${mobileController.text.trim()}');
                  },
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By Continuing, you agree to Memra\'s ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: 'Conditions of use ',
                        style: textTheme.labelMedium!.copyWith(color: indigo),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: textTheme.labelMedium,
                      ),
                      TextSpan(
                        text: ' Privacy Notice!',
                        style: textTheme.labelMedium!.copyWith(color: indigo),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: height * 0.06,
            width: width,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: greyShade3),
              ),
              color: indigo, //greyShade1
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      inLogin = true;
                    });
                  },
                  child: Container(
                    height: height * 0.03,
                    width: height * 0.03,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: white),
                        color: white),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.circle,
                      size: height * 0.015,
                      color: inLogin ? indigo : transparent,
                    ),
                  ),
                ),
                CommonFuctions.blankSpace(
                  0,
                  width * 0.02,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Sign In. ',
                          style: textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.bold, color: white)),
                      TextSpan(
                          text: 'Not your first time here? ',
                          style: textTheme.bodyMedium!.copyWith(color: white))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonAuthButton extends StatelessWidget {
  CommonAuthButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.btnwidth});
  String title;
  VoidCallback onPressed;
  double btnwidth;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width * btnwidth, height * 0.06),
        backgroundColor: indigo,
      ),
      child: Text(
        'Continue',
        style: textTheme.displaySmall!.copyWith(
          color: white,
        ),
      ),
    );
  }
}

class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          height: 2,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [white, indigo, white]),
          ),
        ),
        CommonFuctions.blankSpace(
          height * 0.02,
          0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Condition of Use!',
              style: textTheme.bodyMedium!.copyWith(
                color: indigo,
              ),
            ),
            Text(
              'Privacy Notice!',
              style: textTheme.bodyMedium!.copyWith(
                color: indigo,
              ),
            ),
            Text(
              'Help',
              style: textTheme.bodyMedium!.copyWith(
                color: indigo,
              ),
            ),
          ],
        ),
        CommonFuctions.blankSpace(
          height * 0.01,
          0,
        ),
        Text(
          '© 2023, Memra.com, Inc. or its affiliates',
          style: textTheme.labelMedium!.copyWith(
            color: grey,
          ),
        ),
      ],
    );
  }
}
