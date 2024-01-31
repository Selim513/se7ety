import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_app_1/core/font/app_font.dart';
import 'package:se7ety_app_1/core/utils/app_color.dart';

class CompleteRegister extends StatefulWidget {
  const CompleteRegister({super.key});

  @override
  State<CompleteRegister> createState() => _CompleteRegisterState();
}

class _CompleteRegisterState extends State<CompleteRegister> {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primaryColor,
        title: Text(
          'اكمال عمليه التسجيل',
          style:
              getmeduimfont(color: Colors.white, fontweight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('asset/background.png'),
                      ),
                      Positioned(
                        right: 1,
                        bottom: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.camera_alt_rounded,
                                color: Appcolors.primaryColor,
                              )),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [Text('التخصص')],
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: Appcolors.primaryColor,
                  ),
                  const Gap(10),
                  const Row(
                    children: [Text('نبذه تعريفيه')],
                  ),
                  const Gap(10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يجب املاء الحقل';
                      }
                      return null;
                    },
                    maxLines: 6,
                    decoration: InputDecoration(
                        fillColor: Appcolors.offWhiteColor1.withOpacity(0.9),
                        filled: true,
                        hintText:
                            'سجل المعلومات الطبيه العامه  مثل الاكاديمي وخبراتك السابقه .......'),
                  ),
                  const Gap(10),
                  const Divider(
                    endIndent: 5,
                    indent: 5,
                    color: Colors.black,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        'عنوان العياده',
                        style: getmeduimfont(fontweight: FontWeight.w500),
                      )
                    ],
                  ),
                  const Gap(10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يجب املاء الحقل';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        fillColor: Appcolors.offWhiteColor1.withOpacity(0.9),
                        filled: true,
                        hintText: ' مصر الجديده - الخ-الخ'),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'ساعات العمل من',
                                style:
                                    getmeduimfont(fontweight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Gap(10),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'يجب املاء الحقل';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                fillColor:
                                    Appcolors.offWhiteColor1.withOpacity(.8),
                                filled: true,
                                hintText: 'AM 11:00',
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                        Icons.watch_later_outlined))),
                          ),
                        ],
                      )),
                      const Gap(20),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'الي',
                                  style: getmeduimfont(
                                      fontweight: FontWeight.w500),
                                ),
                              ],
                            ),
                            const Gap(10),
                            TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'يجب املاء الحقل';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  fillColor:
                                      Appcolors.offWhiteColor1.withOpacity(.8),
                                  filled: true,
                                  hintText: 'AM 11:00',
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                          Icons.watch_later_outlined))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        'رقم الهاتف 1 ',
                        style: getmeduimfont(fontweight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Gap(10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يجب املاء الحقل';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        fillColor: Appcolors.offWhiteColor1.withOpacity(0.9),
                        filled: true,
                        hintText: '20xxxxxxxxxx'),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Text(
                        'رقم الهاتف2 (اختياري) ',
                        style: getmeduimfont(fontweight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Gap(10),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'يجب املاء الحقل';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        fillColor: Appcolors.offWhiteColor1.withOpacity(0.9),
                        filled: true,
                        hintText: '20xxxxxxxxxx'),
                  ),
                  const Gap(20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: Appcolors.primaryColor),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print('Done');
                          } else {
                            print("Error");
                          }
                        },
                        child: Text(
                          'التسجيل',
                          style: getmeduimfont(
                              fontweight: FontWeight.w700, color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
