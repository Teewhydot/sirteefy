import 'package:flutter/material.dart';

import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';

Widget buildNavItem(String title,Function? onTap,bool? hasAction, Widget? actionWidget) {
  return GestureDetector(
    onTap: (){
      if(onTap!=null){
        onTap();
      }
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.arrow_forward_ios,
              color: accentColor,
              size: 16,
            ),
            Text(
              title,
              style: AppThemes.firaCodeStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                       ),
            ),
          ],
        ),
        if(hasAction==true && actionWidget!=null)actionWidget,
      ],
    ),
  );
}


class NavItem extends StatelessWidget {
 final String title;
 final  Function? onTap;
 final bool? hasAction;
 final Widget? actionWidget;

  const NavItem({super.key, required this.title, this.onTap, this.hasAction, this.actionWidget});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(onTap!=null){
          onTap!();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.arrow_forward_ios,
                color: accentColor,
                size: 16,
              ),
              Text(
                title,
                style: AppThemes.firaCodeStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          if(hasAction==true && actionWidget!=null)actionWidget!,
        ],
      ),
    );
  }
}
