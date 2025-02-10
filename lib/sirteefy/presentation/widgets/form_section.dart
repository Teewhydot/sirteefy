import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/theme/theme_provider.dart';

class FormSection extends ConsumerStatefulWidget {
  final String formLabel;
  final TextInputType typeOfKeyboard;
  final double? height;
  final bool? isExpand;

  const FormSection(
      {this.height,
      this.isExpand,
      this.formLabel = '',
      this.typeOfKeyboard = TextInputType.text,
      super.key});

  @override
  ConsumerState<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends ConsumerState<FormSection> {
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeProviderController);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.formLabel,style: AppThemes.firaCodeStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),),
          Container(
            height: widget.height,
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: themeProvider.isDarkMode?grayColor:blackColor),),
            child: TextField(
              controller: controller,
              keyboardType: widget.typeOfKeyboard,
              expands: widget.isExpand ?? false,
              minLines: null,
              maxLines: null,
              style: AppThemes.firaCodeStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              onTapOutside: (_) {
                Focus.of(context).unfocus;
              },
            ),
          )
        ],
      ),
    );
  }
}
