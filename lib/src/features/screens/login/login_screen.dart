import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/image_strings/images.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:bachelorapp/src/features/screens/login/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(uniteImage),
                height: size.height * 0.2,
              ),
              Text(
                LoginTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              LoginForm(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('OR'),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                        icon: Image(
                          image: AssetImage(googleLogoImage),
                          width: 20.0,
                        ),
                        onPressed: () {},
                        label: Text(googlSignIn)),
                  ),
                  const SizedBox(
                    height: formHeight - 20,
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text.rich(TextSpan(
                          text: dontHaveAccount,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const [
                            TextSpan(
                              text: signUp,
                              style: TextStyle(color: Colors.blue),
                            )
                          ])))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
