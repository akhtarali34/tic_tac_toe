import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title; // Button title
  final double width; // Button width
  final double height; // Button height
  final VoidCallback onPressed; // Button onPress callback
  final IconData? icon; // Optional icon

  const CustomButton({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.onPressed,
    this.icon, // Optional icon
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) => setState(() {
        isPressed = false;
      }),
      onPointerDown: (_) => setState(() {
        isPressed = true;
      }),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            for (double i = 1; i < 5; i++)
              BoxShadow(
                spreadRadius: -1,
                color: Colors.red,
                blurRadius: (isPressed ? 3 : 2) * i,
                blurStyle: BlurStyle.outer,
              ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            side: const BorderSide(color: Colors.white, width: 2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: widget.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  color: Colors.white,
                ),
              if (widget.icon != null)
                const SizedBox(
                  width: 10,
                ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                  shadows: [
                    for (double i = 1; i < (isPressed ? 8 : 4); i++)
                      Shadow(
                        color: Colors.red,
                        blurRadius: 3 * i,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
