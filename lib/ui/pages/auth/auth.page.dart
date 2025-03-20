import 'package:auth_app/data/service_locator.dart';
import 'package:auth_app/extensions/extension_on_num.dart';
import 'package:auth_app/extensions/extension_on_object.dart';
import 'package:auth_app/ui/constants/app_colors.dart';
import 'package:auth_app/ui/pages/auth/widgets/form_section.dart';
import 'package:auth_app/ui/stores/auth_store/auth.store.dart';
import 'package:auth_app/ui/widgets/hero_section.dart';
import 'package:auth_app/ui/widgets/toaster.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthStore _authStore = serviceLocator.get<AuthStore>();
  OverlayEntry? loadingOverlay;
  OverlayEntry? toastOverlay;
  ReactionDisposer? loadingDisposer;
  ReactionDisposer? showToastDisposer;

  @override
  void initState() {
    initLoadingSideEffect();
    initToastSideEffect();
    super.initState();
  }

  void initLoadingSideEffect() {
    loadingDisposer = reaction(
      (_) => _authStore.loading,
      (bool isLoading) {
        if (isLoading) {
          loadingOverlay = OverlayEntry(builder: (_) => getLoadingOverlay());
          Overlay.of(context).insert(loadingOverlay!);
        } else {
          Future.delayed(const Duration(milliseconds: 2000), () {
            loadingOverlay?.remove();
            loadingOverlay?.dispose();
            loadingOverlay = null;
          });
        }
      },
    );
  }

  void initToastSideEffect() {
    showToastDisposer = reaction(
      (_) => _authStore.shouldShowToast,
      (shouldShowToast) {
        String toastMessage = _authStore.toastMessage;

        if (shouldShowToast.isNotNull && toastMessage.isNotEmpty) {
          Future.delayed(const Duration(milliseconds: 2000), () {
            toastOverlay = OverlayEntry(
                builder: (_) =>
                    getToastOverlay(shouldShowToast!, toastMessage));
            Overlay.of(context).insert(toastOverlay!);

            Future.delayed(const Duration(milliseconds: 2000), () {
              _authStore.showToast(
                isSucceed: null,
              );
            });
          });
        } else {
          toastOverlay?.remove();
          toastOverlay?.dispose();
          toastOverlay = null;
        }
      },
    );
  }

  @override
  void dispose() {
    loadingDisposer?.call();
    showToastDisposer?.call();
    super.dispose();
  }

  Widget getLoadingOverlay() {
    return Container(
      color: AppLightColors.black.withValues(alpha: 0.5),
      child: Center(
        child: CupertinoActivityIndicator(
          color: AppLightColors.primary,
          radius: 22,
        ),
      ),
    );
  }

  Widget getToastOverlay(bool isOptimistic, String message) {
    return Stack(
      children: [
        Container(
          color: AppLightColors.black.withValues(alpha: 0.5),
        ),
        Align(
          alignment: Alignment(0.0, -0.85),
          child: Toaster(
            isOptimistic: isOptimistic,
            message: message,
            onClose: () {},
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              HeroSection(),
              SizedBox(
                height: 92.h(context),
              ),
              FormSection(),
            ],
          ),
        ),
      ),
    );
  }
}
