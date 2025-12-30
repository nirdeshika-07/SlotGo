// import 'package:flutter/material.dart';
// import 'package:game_booking_system/services/games_services.dart';
//
// import '../models/games_model.dart';
// import '../widgets/reusable/reusable_widget.dart';
//
// class OutdoorScreen extends StatefulWidget {
//   const OutdoorScreen({super.key});
//
//   @override
//   State<OutdoorScreen> createState() => _OutdoorScreenState();
// }
//
// class _OutdoorScreenState extends State<OutdoorScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: FutureBuilder<List<GamesModel>>(
//             future: services.fetchOutdoorGames(),
//             builder: (context,snapshot){
//               if(snapshot.connectionState== ConnectionState.waiting){
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if(snapshot.hasError){
//                 return const Center(
//                   child: Text('Error Loading Outdoor Games'),
//                 );
//               }
//               final games=snapshot.data ?? [];
//               if (games.isEmpty) {
//                 return const Center(child: Text('No outdoor games found.'));
//               }
//               return GridView.builder(
//                   itemCount: games.length,
//                   gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.85,
//                     crossAxisSpacing: 12,
//                   ),
//                   itemBuilder: (context,index){
//                     final game=games[index];
//                     return GameCard(game:game);
//                   }
//               );
//             }
//         )
//     );
//   }
// }
//
