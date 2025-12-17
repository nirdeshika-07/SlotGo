import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_booking_system/models/games.dart';

class AppTextStyles{
  static TextStyle bodyStyle({
    Color color = Colors.black,
    double fontSize = 20,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: 'Roboto'
    );
  }
}

class GameCard extends StatelessWidget{
  final Games game;
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
                  child: CachedNetworkImage(
                    imageUrl:'https://th.bing.com/th/id/R.fc4180daaa314633c982c7744db763fc?rik=EVHHwRIR5%2fV5Fg&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2f5%2f58%2fSnooker_table_selby.JPG&ehk=LszUCle0AX6GKMroQVj9%2fgcBQXSp2vX0gV88pSf4WyM%3d&risl=1&pid=ImgRaw&r=0',
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
                        style: AppTextStyles.bodyStyle(),
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