import 'package:flutter/material.dart';

class Week7Ex1 {
  void main() => runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom buttons")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              SelectionButton(),
              SelectionButton(),
              SelectionButton(),
              SelectionButton(),
            ],
          ),
        ),
      ),
    ),
  );
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  bool isSelect = false;
  Text get selectLabel => isSelect
      ? Text("Selected", style: TextStyle(color: Colors.white))
      : Text("Not selected", style: TextStyle(color: Colors.black));
  ButtonStyle get selectButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: isSelect ? Colors.blue[500] : Colors.blue[50],
  );

  void changeSelectState(bool previousSelect) => setState(() {
    isSelect = !previousSelect;
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () => {changeSelectState(isSelect)},
        style: selectButtonStyle,
        child: Center(child: selectLabel),
      ),
    );
  }
}
