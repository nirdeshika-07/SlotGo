import 'dart:convert';

import '../models/games_model.dart';
import '../provider/games_data_provider.dart';

class GamesApiServices{
  final GamesApiProvider gamesApiProvider;

  GamesApiServices({required this.gamesApiProvider});
  // static Future<List<Games>> fetchIndoorGames() async{
  //   await Future.delayed(Duration(milliseconds: 800));
  //   return[
  //     // Games(id: '1', name: 'Snooker', imageUrl: 'https://th.bing.com/th/id/R.fc4180daaa314633c982c7744db763fc?rik=EVHHwRIR5%2fV5Fg&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2f5%2f58%2fSnooker_table_selby.JPG&ehk=LszUCle0AX6GKMroQVj9%2fgcBQXSp2vX0gV88pSf4WyM%3d&risl=1&pid=ImgRaw&r=0', type: 'indoor'),
  //     // Games(id: '2', name: 'Pool', imageUrl: 'https://example.com/pool.jpg', type: 'indoor'),
  //     // Games(id: '3', name: 'Playstation', imageUrl: 'https://example.com/ps.jpg', type: 'indoor'),
  //     // Games(id: '4', name: 'Table Tennis', imageUrl: 'https://example.com/tt.jpg', type: 'indoor')
  //     Games(id: '1', name: 'Snooker', type: 'indoor'),
  //     Games(id: '2', name: 'Pool', type: 'indoor'),
  //     Games(id: '3', name: 'Playstation', type: 'indoor'),
  //     Games(id: '4', name: 'Table Tennis', type: 'indoor')
  //   ];
  // }

  Future<List<GamesModel>> fetchIndoorGames() async {
    try{
      final gamesData = await gamesApiProvider.getData('/sports?type=indoor');

      final data= json.decode (gamesData);

      if(data is List){
        final games=data.map((item)=>GamesModel.fromJson(item as Map<String,dynamic>)).toList();

        final seenNames=<String>{};
        final uniqueGames=<GamesModel> [];

        for(final g in games){
          if(!seenNames.contains(g.name)){
            seenNames.add(g.name);
            uniqueGames.add(g);
          }
        }
        return uniqueGames;
      }
      return [];
    }
    catch(e){
      throw Exception('Indoor games error:$e');
    }
  }
  Future<List<String>> fetchUniqueIndoorNames() async{
    final games= await fetchIndoorGames();
    return games.map((g)=> g.name).toSet().toList();
  }

// static Future<List<Games>> fetchOutdoorGames() async{
//   await Future.delayed(Duration(milliseconds: 800));
//   return[
//     // Games(id: 5, name: 'Badminton', imageUrl: 'https://example.com/badminton.jpg', type: 'outdoor'),
//     // Games(id: 6, name: 'Swimming Pool', imageUrl: 'https://example.com/pool.jpg', type: 'outdoor'),
//     // Games(id: 7, name: 'Cricsal', imageUrl: 'https://example.com/ps.jpg', type: 'outdoor'),
//     // Games(id: 8, name: 'VolleyBall', imageUrl: 'https://example.com/tt.jpg', type: 'outdoor'),
//     Games(id: '5', name: 'Futsal', type: 'outdoor'),
//     Games(id: '6', name: 'Swimming Pool', type: 'outdoor'),
//     Games(id: '7', name: 'Cricsal', type: 'outdoor'),
//     Games(id: '8', name: 'VolleyBall',type: 'outdoor'),
//   ];
// }
  Future<List<GamesModel>> fetchOutdoorGames() async {
    try{
      final gamesData = await gamesApiProvider.getData('/sports?type=outdoor');

      final data = json.decode(gamesData);
      if(data is List){
        final games=data.map((item)=>GamesModel.fromJson(item as Map<String,dynamic>)).toList();

        final seenNames=<String>{};
        final uniqueGames=<GamesModel> [];

        for(final g in games){
          if(!seenNames.contains(g.name)){
            seenNames.add(g.name);
            uniqueGames.add(g);
          }
        }
        return uniqueGames;
      }
      return [];
    }
    catch(e){
      throw Exception('Outdoor games error:$e');
    }
  }
  Future<List<String>> fetchUniqueOutdoorNames() async{
    final games= await fetchIndoorGames();
    return games.map((g)=> g.name).toSet().toList();
  }
}