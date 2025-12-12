import 'package:first_flutter/learnings/week9/ui/components/quiz_component.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  final void Function(String name) onStartPress;
  const StartScreen({super.key, required this.onStartPress});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QuizTitle('Quiz App by not Ronan!'),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 16,
            children: [
              TextField(controller: _nameController),
              QuizButton(
                'Start Quiz',
                onPress: () {
                  if (_nameController.value.text.isNotEmpty) {
                    widget.onStartPress(_nameController.value.text);
                    _nameController.clear();
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
