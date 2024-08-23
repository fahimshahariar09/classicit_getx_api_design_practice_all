import 'package:flutter/material.dart';

class CommonLoadingButton extends StatelessWidget {
  const CommonLoadingButton({super.key, this.buttonHeight, this.buttonWidth, this.fColor});

  final double? buttonHeight;
  final double? buttonWidth;
  final Color? fColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: buttonHeight ?? 45,
        width: buttonWidth ?? MediaQuery.sizeOf(context).width,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
            color: fColor ?? Colors.orange,
          ),
        ),
      ),
    );
  }
}
