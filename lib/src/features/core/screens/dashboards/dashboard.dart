import 'package:bachelorapp/src/constants/Text/Text.dart';
import 'package:bachelorapp/src/constants/colors/color.dart';
import 'package:bachelorapp/src/constants/image_strings/images.dart';
import 'package:bachelorapp/src/constants/sizes/size.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          AppName,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CardBgColor,
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Image(image: AssetImage(userImage))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(dashBoardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DashBoardTitle,
                style: txtTheme.bodyText2,
              ),
              Text(
                DashBoardSubTitle,
                style: txtTheme.headline5,
              ),
              SizedBox(
                height: dashBoardPadding,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(width: 4)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DashBoardSearch,style: txtTheme.headline5?.apply(color: Colors.grey.withOpacity(0.5)),),
                    const Icon(Icons.mic,size: 25,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
