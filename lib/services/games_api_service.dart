import 'dart:convert';
import 'package:http/http.dart' as http;


class GamesApiService{

  final String baseUrl;

  GamesApiService({required this.baseUrl});

  Future<dynamic> get(String endpoint,{Map<String,String>? headers,}) async{
    final url= Uri.parse('$baseUrl$endpoint');

    try{
      final response = await  http.get(
        url,
        headers: headers?? {'Content-Type':'application/json'},
      );
      return _handleResponse(response);
    }
    catch(e){
      throw Exception('GET request error: $e');
    }
  }

  Future<dynamic> post(String endpoint,{Map<String,String>? headers,Map<String,dynamic>? body}) async{
    final url= Uri.parse('$baseUrl $endpoint');
    try{
      final response = await http.post(
          url,
        headers: headers ?? {'Content-Type':'application/json'},
        body: json.encode(body ?? {}),
      );
      return _handleResponse(response);
    }
    catch(e){
      throw Exception('Post request error:$e');
    }
  }

  dynamic _handleResponse(http.Response response){
    final statusCode= response.statusCode;
    if(statusCode>=200 && statusCode<300){
      if(response.body.isEmpty) return null;
      return json.decode (response.body);
    }
    else{
      throw Exception('Request Failed\nSatus:$statusCode\nBody:${response.body}');
    }
  }


}