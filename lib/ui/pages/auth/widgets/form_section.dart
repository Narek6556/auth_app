import 'package:auth_app/data/service_locator.dart';
import 'package:auth_app/ui/constants/app_colors.dart';
import 'package:auth_app/ui/constants/app_texts.dart';
import 'package:auth_app/ui/stores/auth_store/auth.store.dart';
import 'package:auth_app/ui/widgets/segmented_control.dart';
import 'package:auth_app/ui/widgets/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthStore authStore = serviceLocator.get<AuthStore>();

  final segmentsTitles = [
    AppTexts.login,
    AppTexts.signUp,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void onInputTap() {
    authStore.setErrorMessage('');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 162,
            child: Observer(
              builder: (_) {
                return AnimatedSwitcher(
                  duration: const Duration(
                    milliseconds: 350,
                  ),
                  transitionBuilder: (Widget child, animation) {
                    var offsetX = authStore.isLoginSelected ? -2.0 : 2.0;

                    var slideAnimation = Tween<Offset>(
                      begin: Offset(offsetX, 0.0),
                      end: Offset.zero,
                    ).animate(animation);

                    return SlideTransition(
                      position: slideAnimation,
                      child: child,
                    );
                  },
                  child: authStore.isLoginSelected
                      ? Column(
                          key: ValueKey('login'),
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Input(
                              controller: usernameController,
                              width: double.maxFinite,
                              height: 46,
                              borderColor: AppLightColors.primary,
                              textColor: AppLightColors.forground,
                              placeholder: AppTexts.username,
                              onTap: onInputTap,
                            ),
                            Input(
                              controller: passwordController,
                              width: double.maxFinite,
                              height: 46,
                              borderColor: AppLightColors.primary,
                              textColor: AppLightColors.forground,
                              placeholder: AppTexts.password,
                              onTap: onInputTap,
                            ),
                          ],
                        )
                      : Column(
                          key: ValueKey('sign-up'),
                          spacing: 12,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Input(
                              controller: emailController,
                              width: double.maxFinite,
                              height: 46,
                              borderColor: AppLightColors.primary,
                              textColor: AppLightColors.forground,
                              placeholder: AppTexts.email,
                              onTap: onInputTap,
                            ),
                            Input(
                              controller: usernameController,
                              width: double.maxFinite,
                              height: 46,
                              borderColor: AppLightColors.primary,
                              textColor: AppLightColors.forground,
                              placeholder: AppTexts.username,
                              onTap: onInputTap,
                            ),
                            Input(
                              controller: passwordController,
                              width: double.maxFinite,
                              height: 46,
                              borderColor: AppLightColors.primary,
                              textColor: AppLightColors.forground,
                              placeholder: AppTexts.password,
                              onTap: onInputTap,
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Observer(
            builder: (_) {
              return SegmentedControl(
                height: 40,
                width: double.maxFinite,
                backgroundColor: AppLightColors.secondary,
                selectedColor: AppLightColors.button,
                selectedIndex: authStore.selectedIndex,
                segmentsTexts: segmentsTitles,
                onTap: (index) {
                  if (index == authStore.selectedIndex) {
                    authStore.onAuthActionWrapper(
                      emailController.text,
                      usernameController.text,
                      passwordController.text,
                    );
                  } else {
                    authStore.changeSelectedIndex(index);
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 52,
            child: Observer(
              builder: (_) {
                return authStore.errorMessage.isNotEmpty
                    ? Text(
                        authStore.errorMessage,
                        style: _forgetPasswordStyle.copyWith(
                          color: AppLightColors.error,
                        ),
                      )
                    : SizedBox();
              },
            ),
          ),
          Center(
            child: Text(
              AppTexts.forgetPass,
              style: _forgetPasswordStyle.copyWith(
                color: AppLightColors.button,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get _forgetPasswordStyle => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
}
