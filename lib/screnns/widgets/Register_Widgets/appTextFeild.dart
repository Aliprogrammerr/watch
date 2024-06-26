// ignore_for_file: file_names

import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/dimens.dart';
import 'package:flutter/material.dart';


class AppTextFeild extends StatelessWidget {
  const AppTextFeild(
      {required this.controller,required this.hint, super.key, required this.title, required this.type});
  final String title;
  final String hint;
  final TextInputType type;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.large),
        child: Column(
          children: [
             Align(
                alignment: Alignment.topRight,
                child: Text(
                  title,
                  style: AppTextStyle.title,
                )),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller:controller ,
              keyboardType: type,
              decoration: InputDecoration(
                hintText: hint,
              ),
            )
          ],
        ),
      ),
    );
  }
}
