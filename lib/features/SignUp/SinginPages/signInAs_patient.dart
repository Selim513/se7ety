import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';
import 'package:se7ety_app_1/core/function/navigator.dart';
import 'package:se7ety_app_1/core/utils/app_color.dart';
import 'package:se7ety_app_1/features/SignUp/SinginPages/Sing_Up_patient.dart';
import 'package:se7ety_app_1/features/auth/auth_cubit.dart';
import 'package:se7ety_app_1/features/auth/auth_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, required this.index});
  final int index;

  @override
  State<SignInPage> createState() => _PatientSigninState();
}

class _PatientSigninState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var fromKey = GlobalKey<FormState>();
  String usersType() {
    return widget.index == 0 ? 'دكتور' : "مريض";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is SuccessLoginAuth) {
          print('success login');
        } else if (state is ErrorLoginAuth) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.Error)));
        } else {
          showDialog(
            barrierColor: Colors.black.withOpacity(0.7),
            barrierDismissible: true,
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: LottieBuilder.asset(
                'asset/heart3.json',
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ));
            },
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: fromKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 250, child: Image.asset('asset/logo.png')),
                    const Gap(30),
                    Text(
                      ' سجل دخول الان ك "${usersType()}"',
                      style: getlargefont(
                          color: Appcolors.primaryColor,
                          fontweight: FontWeight.w700),
                    ),
                    const Gap(40),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You should enter your email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Appcolors.offWhiteColor1,
                        filled: true,
                        hintText: 'example@example.com',
                        hintTextDirection: TextDirection.ltr,
                        prefixIcon: const Icon(Icons.mail),
                      ),
                    ),
                    const Gap(20),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          fillColor: Appcolors.offWhiteColor1,
                          filled: true,
                          hintText: '*******',
                          hintTextDirection: TextDirection.ltr,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: const Icon(Icons.visibility)),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'نسيت كلمه المرور؟',
                              style: TextStyle(color: Colors.blueAccent),
                            ))
                      ],
                    ),
                    const Gap(40),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.primaryColor,
                          ),
                          onPressed: () async{
                            if (fromKey.currentState!.validate()){
                            await  context.read<AuthCubit>().Login(
                                  emailController.text,
                                  passwordController.text);
                            }
                          },
                          child: Text(
                            'تسجيل الدخول',
                            style: getmeduimfont(color: Colors.white),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لدي حساب؟',
                          style: getmeduimfont(),
                        ),
                        TextButton(
                            onPressed: () {
                              gotoreplacement(
                                  context,
                                  const SignUpPage(
                                    index: 0,
                                  ));
                            },
                            child: Text(
                              'سجل الان',
                              style:
                                  getmeduimfont(color: Appcolors.primaryColor),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
