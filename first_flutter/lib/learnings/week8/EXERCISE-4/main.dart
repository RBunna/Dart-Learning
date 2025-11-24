import 'package:first_flutter/learnings/week8/EXERCISE-4/jokes.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

class Week8Ex4 {
  void main() => runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: JokeContainer(jokes: jokes),
      ),
    ),
  );
}

class JokeContainer extends StatefulWidget {
  const JokeContainer({super.key, required List<Joke> jokes});

  @override
  State<JokeContainer> createState() => _JokeContainerState();
}

class _JokeContainerState extends State<JokeContainer> {
  int? favoriteJokeIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jokes.length,
      itemBuilder: (context, index) => FavoriteCard(
        isFavorite: favoriteJokeIndex == index,
        joke: jokes.elementAt(index),
        onFavoriteClick: () => setState(() {
          favoriteJokeIndex = index;
        }),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final VoidCallback onFavoriteClick;
  final bool _isFavorite;
  final Joke joke;
  
  const FavoriteCard({
    super.key,
    required this.joke,
    required bool isFavorite,
    required this.onFavoriteClick,
  }) : _isFavorite = isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
