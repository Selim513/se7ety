import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';
import 'package:se7ety_app_1/core/function/email_validate.dart';
import 'package:se7ety_app_1/core/function/navigator.dart';
import 'package:se7ety_app_1/core/utils/app_color.dart';
import 'package:se7ety_app_1/features/SignUp/SinginPages/signInAs_patient.dart';
import 'package:se7ety_app_1/features/auth/auth_cubit.dart';
import 'package:se7ety_app_1/features/auth/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.index});
  final int index;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String usersType() {
    return widget.index == 0 ? 'دكتور' : "مريض";
  }

  var fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) async {
        if (state is SuccessRegisterAuth) {
          print('doneeeeeeeeeeee');
          var user = FirebaseAuth.instance.currentUser;
          print(user!.displayName);
        } else if (state is ErrorRegisterAuth) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.Error)));
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
                      ' سجل حساب جديد  ك "${usersType()}"',
                      style: getlargefont(
                          color: Appcolors.primaryColor,
                          fontweight: FontWeight.w700),
                    ),
                    const Gap(40),
                    TextFormField(
                      controller: nameController,
                      textAlign: TextAlign.start,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'يجب ان تدخل اسمك';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        fillColor: Appcolors.offWhiteColor1,
                        filled: true,
                        hintText: 'الاسم',
                        prefixIcon: const Icon(Icons.person),
                      ),
                    ),
                    const Gap(20),
                    TextFormField(
                      controller: emailController,
                      textAlign: TextAlign.end,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'قم بادخال الايميل الخاص بك';
                        } else if (!emailValidate(value)) {
                          return 'من فضلك ادخل الايميل صحيحا';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Appcolors.offWhiteColor1,
                        filled: true,
                        hintText: 'example@example.com',
                        prefixIcon: const Icon(Icons.mail),
                      ),
                    ),
                    const Gap(20),
                    TextFormField(
                      controller: passwordController,
                      textAlign: TextAlign.end,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ادخل الرقم السري';
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          fillColor: Appcolors.offWhiteColor1,
                          filled: true,
                          hintText: '*******',
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
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              if (widget.index == 0) {
                                context.read<AuthCubit>().registerAsDoctor(
                                    nameController.text,
                                    passwordController.text,
                                    emailController.text);
                              } else {
                                context.read<AuthCubit>().registerForPatients(
                                    nameController.text,
                                    passwordController.text,
                                    emailController.text);
                              }
                            }
                          },
                          child: Text(
                            'تسجيل الحساب',
                            style: getmeduimfont(color: Colors.white),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' لديك حساب؟',
                          style: getmeduimfont(),
                        ),
                        TextButton(
                            onPressed: () {
                              gotoreplacement(
                                  context,
                                  const SignInPage(
                                    index: 1,
                                  ));
                            },
                            child: Text(
                              'سجل الدخول',
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
