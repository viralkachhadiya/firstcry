import 'package:demo_task/core/utills/constants.dart';
import 'package:flutter/material.dart';

class RectangleButton extends StatelessWidget {
  final String text;
  final Color? textColor, buttonColor;
  final double textFontSize, elevation;
  final FontWeight textFontWeight;
  final Widget? child;
  final void Function()? onPressed;
  final bool isLoading;
  final EdgeInsets? padding;
  final double radius;
  final BorderSide? borderSide;

  const RectangleButton({
    required this.text,
    this.textColor,
    this.textFontSize = 15.0,
    this.elevation = 4.0,
    this.textFontWeight = FontWeight.bold,
    this.buttonColor,
    this.onPressed,
    this.isLoading = false,
    this.padding,
    this.radius = 12.0,
    this.borderSide,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 46,
                height: 46,
                child: Card(
                  color: buttonColor ?? buttonBackgroundColor,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    child: Container(
                      height: 30.0,
                      width: 30.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: elevation,
              backgroundColor: buttonColor ?? buttonBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: borderSide ?? BorderSide.none,
              ),
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 15,
                  ),
            ),
            onPressed: isLoading ? () {} : onPressed,
            child: isLoading
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      height: 31.0,
                      width: 31.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                  )
                : child ??
                    Center(
                      child: Text(
                        text.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: textFontSize,
                          color: textColor ?? Colors.white,
                          fontWeight: textFontWeight,
                        ),
                      ),
                    ),
          );
  }
}
