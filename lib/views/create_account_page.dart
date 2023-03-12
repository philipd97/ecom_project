import 'package:ecom_project/constants/text_constant.dart';
import 'package:ecom_project/widgets/custom_rounded_button.dart';
import 'package:ecom_project/widgets/custom_text_field.dart';
import 'package:ecom_project/widgets/customized_sliver.dart';
import 'package:ecom_project/widgets/scaffold_customed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:iconly/iconly.dart';
import 'package:sizer/sizer.dart';

class CreateAccountPage extends HookWidget {
  static const routeName = 'create-account-page';

  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizedBox = SizedBox(height: 1.h);
    final emailController = useTextEditingController();
    final passController = useTextEditingController();
    final confirmPassController = useTextEditingController();
    final shipAddressController = useTextEditingController();
    final phoneNoController = useTextEditingController();

    return ScaffoldCustomed(
      hasAppBar: false,
      bottomNavigationBar: CustomRoundedButton(
        onPressed: () {},
        label: TextConstants.createAccount,
      ),
      child: CustomizedSliver(
        title: TextConstants.createAccount.breakLine(),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  CustomTextField(
                    controller: emailController,
                    iconData: IconlyLight.message,
                    label: TextConstants.email,
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  sizedBox,
                  CustomTextField(
                    controller: passController,
                    iconData: IconlyLight.password,
                    label: TextConstants.password,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                  ),
                  sizedBox,
                  CustomTextField(
                    controller: confirmPassController,
                    iconData: IconlyLight.password,
                    label: TextConstants.confirmPassword,
                    obscureText: true,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                  ),
                  sizedBox,
                  CustomTextField(
                    controller: shipAddressController,
                    iconData: IconlyLight.location,
                    label: TextConstants.shippingAddress,
                    textInputType: TextInputType.multiline,
                    textInputAction: TextInputAction.next,
                    maxLine: null,
                  ),
                  sizedBox,
                  CustomTextField(
                    controller: phoneNoController,
                    iconData: IconlyLight.call,
                    label: TextConstants.phoneNo,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
