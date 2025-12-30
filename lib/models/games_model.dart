class GamesModel{
  final String id;
  final String name;
  final String imageUrl;
  final String type;

  GamesModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type
  });

  factory GamesModel.fromJson(Map<String,dynamic> json){
    return GamesModel(
    id: (json['_id'] as String). toString(),
    name: (json['name'] as String).toString(),
    imageUrl: json['image'] ?? '',
    type: (json['type'] as String).toString()
  );
  }
}