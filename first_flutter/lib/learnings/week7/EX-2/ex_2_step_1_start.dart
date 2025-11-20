import 'package:flutter/material.dart';

class Week7Ex2 {
  void main() => runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(title: 'title', description: 'description'),
            FavoriteCard(title: 'title', description: 'description'),
            FavoriteCard(title: 'title', description: 'description'),
          ],
        ),
      ),
    ),
  );
}

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;

  const FavoriteCard({super.key, required this.title, required this.description});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  Icon get favoriteIcon => isFavorite
      ? Icon(Icons.favorite, color: Colors.red)
      : Icon(Icons.favorite_border_rounded);

  void favoriteTransition() => setState(() {
    isFavorite = !isFavorite;
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 12, 4, 12),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: 6,
                  children: [
                    Text(widget.title, style: TextStyle(color: Colors.blue)),
                    Text(
                      widget.description,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(onPressed: favoriteTransition, icon: favoriteIcon),
            ],
          ),
        ),
        Container(
          height: 2,
          decoration: BoxDecoration(color: Colors.grey[300]),
        ),
      ],
    );
  }
}
