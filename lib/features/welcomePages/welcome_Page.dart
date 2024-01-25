import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';
import 'package:se7ety_app_1/core/function/navigator.dart';
import 'package:se7ety_app_1/core/model/pageview.dart';
import 'package:se7ety_app_1/core/utils/app_color.dart';
import 'package:se7ety_app_1/features/welcomePages/welcome_signup.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var controller = PageController();
  int currenindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                gotoreplacement(context, const SignUpAs());
              },
              child: Text(
                'تخطي',
                style: getsmallfont(color: Appcolors.primaryColor),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currenindex = value;
                    });
                  },
                  controller: controller,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SvgPicture.asset(
                          pageData[index].image,
                          width: 350,
                        ),
                        const Gap(30),
                        Text(
                          pageData[index].titile,
                          style: getlargefont(
                              color: Appcolors.primaryColor,
                              fontweight: FontWeight.w700),
                        ),
                        const Gap(30),
                        Text(
                          pageData[index].description,
                          textAlign: TextAlign.center,
                          style: getmeduimfont(),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            activeDotColor: Appcolors.primaryColor),
                      ),
                    ),
                    const Spacer(),
                    if (currenindex == 2)
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            backgroundColor: Appcolors.primaryColor,
                          ),
                          onPressed: () {
                            gotoreplacement(context, const SignUpAs());
                          },
                          child: Text(
                            'هيا بنا',
                            style: getsmallfont(color: Colors.white),
                          ))
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
