import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/gen/colors.gen.dart';
import 'package:ecom_project/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ScaffoldCustomed extends StatelessWidget {
  final Widget child;
  final Widget? bottomNavigationBar;
  final String? titleLabel;
  final Widget? trailingWidget;
  final bool hasBackBtn;
  final bool hasAppBar;

  const ScaffoldCustomed({
    super.key,
    required this.child,
    this.hasAppBar = true,
    this.bottomNavigationBar,
    this.hasBackBtn = true,
    this.trailingWidget,
    this.titleLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !hasAppBar
          ? null
          : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              automaticallyImplyLeading: false,
              leading: hasBackBtn ? const CustomBackButton() : null,
              actions: trailingWidget != null ? [trailingWidget!] : null,
              centerTitle: true,
              title: titleLabel == null
                  ? null
                  : Text(
                      titleLabel!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
            ),
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: ColorName.greyLightBackground,
      body: child,
    );
  }
}
