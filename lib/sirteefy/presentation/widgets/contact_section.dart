import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/angle_widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/other/misc.dart';
import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';
import 'form_section.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowSpacing: 10,
      columnSpacing: 10,
      rowMainAxisAlignment: MainAxisAlignment.start,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
     || ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'I am available for freelance work. If you have a project that you want to get started, think you need my help with something or just fancy saying hi, then get in touch.',
                  style: AppThemes.firaCodeStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    )),
              const SizedBox(height: 20),
              // ContactFormWidget(),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: accentColor, width: 2),
                borderRadius:
                    const BorderRadius.all(Radius.circular(borderWidthRadius))),
            child:Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: FormSection(
                            formLabel: "First Name",
                          ),
                        ),
                        Expanded(
                          child: FormSection(
                            formLabel: "Last Name",
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    const Row(
                      children: [
                        Expanded(
                          child: FormSection(
                            formLabel: "Email ID",
                            typeOfKeyboard: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    const FormSection(
                      formLabel: "Message",
                      height: 200,
                      typeOfKeyboard: TextInputType.text,
                      isExpand: true,
                    ),
                    verticalSpace(20),
                     Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProjectButton(borderColor: accentColor, icon: Icons.send, text: "Send",onTap: (){},),
                    )
                  ],
                ),
                const Positioned(top: -10,left: -10,  child: AngleWidget(angleType: AngleType.left)),
                const Positioned(bottom: -10,right: -10,  child: AngleWidget(angleType: AngleType.right)),
              ],
            )
          ),
        ),
      ],
    );
  }
}
