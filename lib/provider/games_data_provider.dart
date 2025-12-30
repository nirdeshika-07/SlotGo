import 'package:http/http.dart' as http;

class GamesApiProvider{
  final String baseUrl = 'https://booking-system-4kmh.onrender.com/api';

  Future<String> getData(String endpoint,{Map<String,String>? headers}) async{
    final url= Uri.parse('$baseUrl$endpoint');

    try{
      final response = await  http.get(
        url,
        headers: headers?? {'Content-Type':'application/json'},
      );
      return response.body;
    }
    catch(e){
      throw Exception('GET request error: $e');
    }
  }

}