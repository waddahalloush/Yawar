import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:heroicons/heroicons.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
    this.label,
    required this.heroIcons,
    required this.heroIconStyle,
    this.color,
    this.onTap,
  }) : super(key: key);

  final String? label;
  final HeroIcons heroIcons;
  final HeroIconStyle heroIconStyle;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(5.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeroIcon(
              heroIcons,
              style: heroIconStyle,
              color: color ?? Colors.grey,
              size: 20.sp,
            ),
            if (label != null) ...[
              SizedBox(width: 5.w,),
              Text(
                label!,
                style: Theme.of(context).primaryTextTheme.labelSmall,
              ),
            ]
          ],
        ),
      ),
    );
  }
}
