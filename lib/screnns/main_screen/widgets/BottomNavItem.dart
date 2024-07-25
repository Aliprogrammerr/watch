import 'package:flex/constant/AppColors.dart';
import 'package:flutter/material.dart';
class BottomNavItem extends StatelessWidget {
  const BottomNavItem({super.key, required this.ontap,required this.icon,required this.isAtice });
  final Function() ontap;
  final IconData icon;
  final bool isAtice;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  GestureDetector(
        onTap: ontap,
         child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          color: MyColors.primaryColor,
          height: size.height * 0.9,
          width: size.width*0.2,
          child :
           Icon(size: isAtice ? 40 : 30,icon ,color: isAtice ? MyColors.bottonNavActive : Color.fromARGB(255, 87, 87, 87),),
           ), 
        
    );


  }

}