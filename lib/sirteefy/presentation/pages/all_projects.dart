import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/section_header.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import '../../../generated/assets.dart';
import '../../../utils/color_palette/colors.dart';
import '../widgets/header.dart';
import '../widgets/matrix_dot widget.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned(
                top: 60,
                left: 0,
                child: Opacity(
                  opacity: 0.1,
                  child: MatrixDot(
                    l: 6,
                    r: 6,
                  ),
                ),
              ),
              const Positioned(
                top: 0,
                left: 60,
                child: Opacity(
                  opacity: 0.1,
                  child: MatrixDot(
                    l: 6,
                    r: 6,
                  ),
                ),
              ),
              Positioned(
                  bottom: -20,
                  left: 250,
                  child: Opacity(
                    opacity: 0.1,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(
                          color: textColorPurple,
                          width: 2,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 20,
                  right: 250,
                  child: Opacity(
                    opacity: 0.1,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(
                          color: textColorPurple,
                          width: 2,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: -20,
                  left: -20,
                  child: Opacity(
                    opacity: 0.1,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(
                          color: textColorPurple,
                          width: 2,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  top: 20,
                  left: 250,
                  child: Opacity(
                    opacity: 0.1,
                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(
                          color: textColorPurple,
                          width: 2,
                        ),
                      ),
                    ),
                  )),
              const Positioned(
                top: 200,
                left: 300,
                child: Opacity(
                  opacity: 0.1,
                  child: MatrixDot(
                    l: 6,
                    r: 6,
                  ),
                ),
              ),
              const Positioned(
                bottom: 200,
                left: 300,
                child: Opacity(
                  opacity: 0.1,
                  child: MatrixDot(
                    l: 6,
                    r: 6,
                  ),
                ),
              ),
              const Positioned(
                top: 200,
                right: 300,
                child: Opacity(
                  opacity: 0.1,
                  child: MatrixDot(
                    l: 6,
                    r: 6,
                  ),
                ),
              ),
              Positioned(
                  top: 200,
                  left: 100,
                  child: Opacity(
                      opacity: 0.1,
                      child: SvgPicture.asset(Assets.svgsRectangleDesign))),
              Positioned(
                  top: 300,
                  left: -50,
                  child: Opacity(
                      opacity: 0.1,
                      child: SvgPicture.asset(Assets.svgsRectangleDesign))),
              Positioned(
                  top: 300,
                  right: -50,
                  child: Opacity(
                      opacity: 0.1,
                      child: SvgPicture.asset(Assets.svgsRectangleDesign))),
              Positioned(
                  bottom: 300,
                  right: -50,
                  child: Opacity(
                      opacity: 0.1,
                      child: SvgPicture.asset(Assets.svgsRectangleDesign))),
              Positioned(
                  top: 100,
                  left: 450,
                  child: Opacity(
                    opacity: 0.1,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(
                          color: textColorPurple,
                          width: 2,
                        ),
                      ),
                    ),
                  )),
              SingleChildScrollView(
                child: Column(children: [
                  const Header(),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SectionHeader(title: "Projects", rightSection: false),
                  ),
                  verticalSpace(50),
                  ResponsiveGridView.builder(
                    alignment: Alignment.center,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const ResponsiveGridDelegate(
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      crossAxisExtent: 350,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.green,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Project ${index + 1}'),
                            const SizedBox(height: 10),
                            Text('Description of project ${index + 1}'),
                          ],
                        ),
                      );
                    },
                  ),
                ]),
              ),
            ]
          ),
        ));
  }
}
