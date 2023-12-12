import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/colors/color.dart';
import 'package:bachelorapp/src/constants/image_strings/images.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:bachelorapp/src/features/screens/login/login_screen.dart';
import 'package:bachelorapp/src/features/screens/sing_up/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:bachelorapp/src/utils/theme/theme.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    var height = mediaQuery.size.height;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? SecondaryColor : WhiteColor,
      body: Container(
        padding: EdgeInsets.all(defaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(welcomeImage),
              height: height * 0.5,
            ),
            Text(
              welcomeTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              welcomeSubTitle,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          )),
                      child: Text(
                        login.toUpperCase(),
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        )),
                    child: Text(
                      signUp.toUpperCase(),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
