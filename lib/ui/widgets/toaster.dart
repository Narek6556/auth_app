import 'package:auth_app/extensions/extension_on_num.dart';
import 'package:auth_app/ui/constants/app_assets.dart';
import 'package:auth_app/ui/constants/app_colors.dart';
import 'package:auth_app/ui/constants/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Toaster extends StatelessWidget {
  final bool isOptimistic;
  final String message;
  final VoidCallback onClose;

  const Toaster({
    super.key,
    required this.isOptimistic,
    required this.message,
    required this.onClose,
  });

  Color get backgroundColor =>
      isOptimistic ? AppLightColors.success : AppLightColors.error;

  String get title => isOptimistic ? AppTexts.wellDone : AppTexts.error;

  String get leadingIconAssetName =>
      isOptimistic ? AppAssets.done : AppAssets.xCircle;

  TextStyle get titleStyle => TextStyle(
        fontSize: 20,
        color: AppLightColors.white,
        fontWeight: FontWeight.w500,
      );

  TextStyle get messageStyle => TextStyle(
        fontSize: 14,
        color: AppLightColors.white,
        fontWeight: FontWeight.w400,
      );

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 343,
        height: 93,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.w(context),
          horizontal: 12.w(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SvgPicture.asset(leadingIconAssetName),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: titleStyle,
                  ),
                  Text(
                    message,
                    style: messageStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: onClose,
                child: SvgPicture.asset(AppAssets.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
