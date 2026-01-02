import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/models/games_model.dart';

class GameCard extends StatelessWidget{
  final GamesModel game;
  const GameCard({Key? key ,required this.game}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{},
      // _navigateToCenters(context,game),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),

                  child: (game.imageUrl.isEmpty)
                      ? Image.asset(
                    "assets/images/no_image.jpg",
                    fit: BoxFit.cover,
                  )
                      :CachedNetworkImage(
                    imageUrl:game.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context,url)=> Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.sports_esports_outlined, size:40,color: Colors.grey),
                    ),
                    errorWidget: (context,url, error)=>Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.error_rounded,color:  Colors.red[300]),
                    ),
                  ),
                )
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.name,
                      style: TextStyle(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}