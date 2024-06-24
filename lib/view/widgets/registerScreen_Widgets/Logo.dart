import 'package:flutter/cupertino.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            "assets/png/logo-color.png",
            width: 60,
            height: 60,
          )),
    );
  }
}
