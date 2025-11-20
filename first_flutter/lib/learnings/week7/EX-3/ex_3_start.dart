import 'package:flutter/material.dart';

List<String> images = [
  "assets/week7/w4-s2/EX-3/bird.jpg",
  "assets/week7/w4-s2/EX-3/bird2.jpg",
  "assets/week7/w4-s2/EX-3/insect.jpg",
  "assets/week7/w4-s2/EX-3/girl.jpg",
  "assets/week7/w4-s2/EX-3/man.jpg",
];

class Week7Ex3 {
  // ================ Code searched from internet ==================
  // url: https://stackoverflow.com/a/59414080
  final imageCardKey = GlobalKey<_ImageWindowState>();
  ImageWindow get imageCard => ImageWindow(key: imageCardKey);

  void main() => runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      // Answer: The above line removes the debug banner at the top-right corner of the window frame
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: () => {imageCardKey.currentState!.changeImage(-1)},
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: () => {imageCardKey.currentState!.changeImage(1)},
              ),
            ),
          ],
        ),
        body: imageCard,
      ),
    ),
  );
}

class ImageWindow extends StatefulWidget {
  const ImageWindow({super.key});

  @override
  State<ImageWindow> createState() => _ImageWindowState();
}

class _ImageWindowState extends State<ImageWindow> {
  int imageIndex = 0;

  Image get image => Image.asset(images[imageIndex]);

  void changeImage(int numberOfImageChange) => setState(() {
    imageIndex += numberOfImageChange;
    imageIndex = imageIndex % images.length; 
  });
  @override
  Widget build(BuildContext context) {
    return image;
  }
}
