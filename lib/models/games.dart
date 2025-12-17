class Games{
  final String id;
  final String name;
  // final String imageUrl;
  final String type;

  Games({
    required this.id,
    required this.name,
    // required this.imageUrl,
    required this.type
  });

  factory Games.fromJson(Map<String,dynamic> json){
    return Games(
    id: json['_id'] as String,
    name: json['name'] as String,
    // imageUrl: json['imageUrl'] ?? '',
    type: json['type'] as String
  );
  }
}