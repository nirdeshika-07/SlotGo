import 'package:flutter/material.dart';

import '../services/games_api_service.dart';
import '../services/games_services.dart';

class GamesApiProvider extends ChangeNotifier{
  late final GamesApiService apiService;
  late final GamesServices gamesServices;

  GamesApiProvider(){
    apiService= GamesApiService(baseUrl: 'https://booking-system-4kmh.onrender.com/api');
    gamesServices= GamesServices(gamesApiService: apiService);
  }
}

class ServicesProvider extends ChangeNotifier {
  int _currentTab = 0;
  int get currentTab => _currentTab;

  void switchTab(int index) {
    _currentTab = index;
    notifyListeners();
  }
}
