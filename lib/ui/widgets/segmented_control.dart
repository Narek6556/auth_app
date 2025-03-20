import 'package:auth_app/ui/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SegmentedControl extends StatelessWidget {
  final double width;
  final double height;
  final int selectedIndex;
  final List<String> segmentsTexts;
  final Color selectedColor;
  final Color backgroundColor;
  final Function(int) onTap;

  const SegmentedControl({
    super.key,
    required this.height,
    required this.width,
    required this.selectedIndex,
    required this.segmentsTexts,
    required this.backgroundColor,
    required this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              for (int index = 0; index < segmentsTexts.length; index++)
                GestureDetector(
                  onTap: () => onTap(index),
                  child: Container(
                    color: Colors.transparent,
                    child: _getSegment(index, constraints),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _getSegment(int index, BoxConstraints constraints) {
    var title = segmentsTexts[index];
    var segmentWidth = constraints.maxWidth / segmentsTexts.length;

    if (index == selectedIndex) {
      return Container(
        height: height,
        width: segmentWidth,
        decoration: BoxDecoration(
          color: selectedColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: _textStyle.copyWith(color: AppLightColors.white),
          ),
        ),
      );
    }

    return SizedBox(
      width: segmentWidth,
      height: height,
      child: Center(
        child: Text(
          title,
          style: _textStyle.copyWith(
            color: AppLightColors.forground,
          ),
        ),
      ),
    );
  }

  TextStyle get _textStyle => TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
}
