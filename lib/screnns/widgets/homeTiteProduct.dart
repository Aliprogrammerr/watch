import 'package:flex/compunents/TextStyles.dart';
import 'package:flex/constant/AppColors.dart';
import 'package:flutter/cupertino.dart';

class TitleProductbtn extends StatelessWidget {
  const TitleProductbtn({
    super.key,
    required this.ontap,
    required this.size,
    required this.isActive,
    required this.text
  });

  final Size size;
  final bool isActive;
  final Function() ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: size.width * .4,
        height: 50,
        decoration: BoxDecoration(
            color: isActive ? MyColors.primaryColor : MyColors.blackColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        child: Center(
            child: Text(
          text,
          style:
              isActive ? AppTextStyle.productitle1 : AppTextStyle.productitle2,
        )),
      ),
    );
  }
}
