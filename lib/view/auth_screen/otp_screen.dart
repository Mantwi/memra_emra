import 'package:flutter/material.dart';
import 'package:memra/constants/common_functions.dart';
import 'package:memra/view/auth_screen/auth_screens.dart';

import '../../controller/services/auth_services/auth_services.dart';
import '../../utils/colors.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key, required this.mobileNumber});
  String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage('assets/images/memra.jpg'),
          height: height * 0.070,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Authentication Required',
                  style: textTheme.displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                CommonFuctions.blankSpace(
                  height * 0.01,
                  0,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.mobileNumber,
                        style: textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: ' Change',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                Text(
                  'We have sent a One Time Password (OTP) to the mobile number above. Please enter it to complete verification.',
                  style: textTheme.bodyMedium,
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
                  0,
                ),
                TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP',
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
                CommonFuctions.blankSpace(
                  height * 0.01,
                  0,
                ),
                CommonAuthButton(
                  title: 'Continue',
                  onPressed: () {
                    AuthServices.verifyOTP(
                      context: context,
                      otp: otpController.text.trim(),
                    );
                  },
                  btnwidth: 0.94,
                ),
                CommonFuctions.blankSpace(
                  height * 0.01,
                  0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Resend OTP',
                        style: textTheme.bodyMedium!.copyWith(
                          color: indigo,
                        ),
                      ),
                    ),
                  ],
                ),
                CommonFuctions.blankSpace(
                  height * 0.02,
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
}
