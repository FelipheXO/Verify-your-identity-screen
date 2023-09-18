import 'package:flutter/material.dart';
import 'package:verifyface/utills/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPress, required this.title});
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: 50,
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(5)),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
