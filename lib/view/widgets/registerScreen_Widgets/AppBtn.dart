import 'package:flex/compunents/TextStyles.dart';
import 'package:flutter/material.dart';
import '../../../constant/AppColors.dart';
import '../../../constant/dimens.dart';


class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.width,
      required this.ontap,
      required this.text});
  final void Function() ontap;
  final String text;

  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppDimens.medium)),
        color: MyColors.primaryColor,
      ),
      height: 45,
      width: width,
      child: InkWell(
        onTap: ontap,
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.btnText,
          ),
        ),
      ),
    );
  }
}
