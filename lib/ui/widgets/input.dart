import 'package:auth_app/ui/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final Color borderColor;
  final Color textColor;
  final String? placeholder;
  final VoidCallback onTap;

  const Input({
    super.key,
    required this.controller,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
    this.placeholder,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool shouldShowPlaceHolder = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    if (widget.placeholder != null) {
      shouldShowPlaceHolder = true;
    }

    widget.controller.addListener(placeholderListner);
    super.initState();
  }

  void placeholderListner() {
    setState(() {
      shouldShowPlaceHolder = widget.controller.text.isEmpty;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(placeholderListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.borderColor,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        height: widget.height,
        width: widget.width,
        child: Stack(
          children: [
            if (widget.controller.text.isEmpty && shouldShowPlaceHolder)
              Text(
                widget.placeholder!,
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            EditableText(
              onTapOutside: (_) {
                _focusNode.unfocus();
              },
              controller: widget.controller,
              focusNode: _focusNode,
              style: _textStyle,
              cursorColor: AppLightColors.primary,
              backgroundCursorColor: AppLightColors.secondary,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _textStyle => TextStyle(
        color: widget.textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
}
