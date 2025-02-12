import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/main.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/angle_widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/other/misc.dart';
import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';
import '../manager/contact/send_message_bloc.dart';
import 'form_section.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowSpacing: 10,
      columnSpacing: 10,
      rowMainAxisAlignment: MainAxisAlignment.start,
      rowCrossAxisAlignment: CrossAxisAlignment.start,
      layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
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
                  borderRadius: const BorderRadius.all(
                      Radius.circular(borderWidthRadius))),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: FormSection(
                              formLabel: "First Name",
                              textEditingController: firstNameController,
                            ),
                          ),
                          Expanded(
                            child: FormSection(
                              formLabel: "Last Name",
                              textEditingController: lastNameController,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Row(
                        children: [
                          Expanded(
                            child: FormSection(
                              formLabel: "Email ID",
                              typeOfKeyboard: TextInputType.emailAddress,
                              textEditingController: emailController,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      FormSection(
                        formLabel: "Message",
                        height: 200,
                        typeOfKeyboard: TextInputType.text,
                        isExpand: true,
                        textEditingController: messageController,
                      ),
                      verticalSpace(20),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocConsumer<SendMessageBloc, SendMessageState>(
                          listener: (context, state) {
                            if (state is SendMessageLoaded) {
                              firstNameController.clear();
                              lastNameController.clear();
                              emailController.clear();
                              messageController.clear();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Message sent successfully'),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            } else if (state is SendMessageError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to send message'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            String buttonText = 'Send';
                            if (state is SendMessageLoading) {
                              buttonText = 'Sending...';
                            } else if (state is SendMessageLoaded) {
                              buttonText = 'Sent';

                            } else if (state is SendMessageError) {
                              buttonText = 'Failed';
                            } else if (state is SendMessageInitial){
                              buttonText = 'Send';
                            }
                            return  ProjectButton(
                              borderColor: accentColor,
                              icon: Icons.send,
                              text: buttonText,
                              onTap: () {
                                if (firstNameController.text.isNotEmpty &&
                                    lastNameController.text.isNotEmpty &&
                                    emailController.text.isNotEmpty &&
                                    messageController.text.isNotEmpty) {
                                  context.read<SendMessageBloc>().add(
                                      SendMessageRequested(
                                          name:
                                          "${firstNameController
                                              .text} ${lastNameController.text}",
                                          email: emailController.text,
                                          message: messageController.text));
                                }
                              },
                            );
                            },
                        ),
                      )
                    ],
                  ),
                  const Positioned(
                      top: -10,
                      left: -10,
                      child: AngleWidget(angleType: AngleType.left)),
                  const Positioned(
                      bottom: -10,
                      right: -10,
                      child: AngleWidget(angleType: AngleType.right)),
                ],
              )),
        ),
      ],
    );
  }
}
