import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  VoidCallback onClick;

  ButtonContainer(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Color(0xff1F5EFF).withOpacity(0.54),
          width: 165.w,
          height: 122.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 35.h,
                ),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
