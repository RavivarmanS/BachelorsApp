import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/image_strings/images.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:bachelorapp/src/features/authentication/google_authentication/google_signin.dart';
import 'package:bachelorapp/src/utils/theme/widget_themes/signUpFormWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(

        resizeToAvoidBottomInset : false,

        body: Container(
          child: Column(
            children: [
              SingleChildScrollView(
                child:Column(
                  children: [Center(
                    child: Image(
                      image: AssetImage(uniteImage),
                      height: size.height * 0.2,
                    ),
                  ),
                    Text(
                      signUp,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineMedium,
                    ),
                    Text(
                      signUpSubtitle,
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium,
                    ),
                    SizedBox(
                      height: formHeight,
                    ),
                    SignUpFormWidget(size: size),
                    const Text('OR'),
                    Padding(
                      padding: const EdgeInsets.all(defaultSize),
                      child: Column(
                        children: [

                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: ()async{
                                User? user = await signInWithGoogle();
                                },
                              icon:const Image(image: AssetImage(googleLogoImage),width: 20.0,),
                              label: Text(googlSignIn.toUpperCase()),
                            ),
                          ),
                          TextButton(
                              onPressed: (){},
                              child: Text.rich(TextSpan(
                                children: [
                                  TextSpan(text: alreadyHaveAccount,style: Theme.of(context).textTheme.bodyLarge),
                                  TextSpan(text: login.toUpperCase(),),
                                ]
                              )))
                        ],
                      ),
                    )
                  ],

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


