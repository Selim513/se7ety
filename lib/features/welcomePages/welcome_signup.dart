import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';
import 'package:se7ety_app_1/core/function/navigator.dart';
import 'package:se7ety_app_1/core/utils/app_color.dart';
import 'package:se7ety_app_1/features/SignUp/SinginPages/signInAs_patient.dart';

class SignUpAs extends StatefulWidget {
  const SignUpAs({super.key});

  @override
  State<SignUpAs> createState() => _SignUpAsState();
}

class _SignUpAsState extends State<SignUpAs> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'asset/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                right: 20,
                top: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أهلا بيك',
                      style: getlargefont(
                          color: Appcolors.primaryColor, fontsize: 50),
                    ),
                    const Gap(20),
                    Text(
                      'سجل واحجز عند دكتورك وانت في البيت',
                      style: getsmallfont(fontsize: 18),
                    ),
                  ],
                )),
            Positioned(
                left: 10,
                right: 10,
                bottom: 30,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 290,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Appcolors.primaryColor.withOpacity(.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'سجل دلوقتي ك',
                            style: getlargefont(
                                color: Colors.white,
                                fontweight: FontWeight.w400),
                          ),
                          const Gap(30),
                          SizedBox(
                            height: 70,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    visualDensity: const VisualDensity(),
                                    backgroundColor:
                                        Appcolors.whiteColor.withOpacity(.7),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  gotopush(context, const SignInPage(index: 0,));
                                },
                                child: Text(
                                  "دكتور",
                                  style: getlargefont(),
                                )),
                          ),
                          const Gap(10),
                          SizedBox(
                            height: 70,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Appcolors.whiteColor.withOpacity(.7),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                onPressed: () {
                                  gotopush(context, const SignInPage(index: 1,));
                                },
                                child: Text(
                                  "مريض",
                                  style: getlargefont(),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
