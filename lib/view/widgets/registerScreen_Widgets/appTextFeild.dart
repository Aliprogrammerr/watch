import 'package:flex/compunents/TextStyles.dart';
import 'package:flutter/material.dart';
import '../../../constant/AppColors.dart';
import '../../../constant/dimens.dart';


class AppTextFeild extends StatelessWidget {
  const AppTextFeild(
      {required this.hint, super.key, required this.title, required this.type});
  final String title;
  final String hint;
  final TextInputType type;
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
            const SizedBox(height: 35,),
            TextField(
              keyboardType: type,
              decoration: InputDecoration(
                  hintText: hint,
                  fillColor: MyColors.textFeildColor,
                  filled: true,
                  hintStyle: AppTextStyle.hint,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: MyColors.borderColor, width: 2),
                      borderRadius: BorderRadius.circular(AppDimens.medium))),
            )
          ],
        ),
      ),
    );
  }
}
