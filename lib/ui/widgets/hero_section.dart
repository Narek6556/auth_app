import 'package:auth_app/extensions/extension_on_num.dart';
import 'package:auth_app/ui/constants/app_assets.dart';
import 'package:auth_app/ui/constants/app_colors.dart';
import 'package:auth_app/ui/widgets/curved_rectangle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 257.h(context),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(
              MediaQuery.of(context).size.width,
              257.h(context),
            ),
            painter: CurvedRectanglePainter(
              color: AppLightColors.secondary,
            ),
          ),
          Positioned(
            top: 54.h(context),
            left: 24.h(context),
            child: SvgPicture.asset(AppAssets.logo),
          ),
        ],
      ),
    );
  }
}
