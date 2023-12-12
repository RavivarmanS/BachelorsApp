import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:bachelorapp/src/features/screens/forget_password/forgetpassword_mail/ForgetPasswordMail.dart';
import 'package:bachelorapp/src/features/screens/forget_password/forgetpassword_options/ForgetPasswordBtnWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ForgetPasswordTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              ForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: Email,
              subTitle: ResetViaMail,
              onTap: () {
                Navigator.pop(context);

                Get.to(()=> const ForgetPasswordMailScreen());
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ForgetPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_rounded,
              title: Phone,
              subTitle: ResetViaPhone,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
