import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            CustomButton(
              label: "Submit",
              icon: Icons.check,
              type: ButtonType.primary,
            ),
            SizedBox(height: 10),
            CustomButton(
              label: "Time",
              icon: Icons.access_time_sharp,
              type: ButtonType.secondary,
              iconPosition: IconPosition.textFirst,
            ),
            SizedBox(height: 10),
            CustomButton(
              label: "Account",
              icon: Icons.account_tree,
              type: ButtonType.disabled,
              iconPosition: IconPosition.textFirst,
            ),
          ],
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, disabled }

enum IconPosition { iconFirst, textFirst }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final ButtonType type;
  final IconPosition iconPosition;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.type = ButtonType.primary,
    this.iconPosition = IconPosition.iconFirst,
  });

  Color get color {
    switch (type) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  List<Widget> get content {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Icon(icon, size: 24.0, color: Colors.white),
      ),
      Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: iconPosition == IconPosition.iconFirst
              ? content
              : content.reversed.toList(),
        ),
      ),
    );
  }
}
