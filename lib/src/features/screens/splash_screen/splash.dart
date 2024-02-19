import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/image_strings/images.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:bachelorapp/src/features/screens/welcome_screen/welcome.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  double opacity = 0.1;

  @override
  void initState() {
    StartAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            Positioned(
              top: 80,
                left: 0,
                right: 0,
                child: Image(image: AssetImage(uniteImage),
                )
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,80.0,8.0,8.0),
              child: Center(

                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: opacity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(mainTitle,style: Theme.of(context).textTheme.headlineMedium,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(subTitle,style: Theme.of(context).textTheme.bodyMedium,),
                        ),
                      ],
                    ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future StartAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    setState(() => opacity = 1.0 );
    await Future.delayed(Duration(milliseconds: 3000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
  }
}
