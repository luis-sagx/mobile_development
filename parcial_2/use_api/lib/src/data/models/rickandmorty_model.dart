import '../../domain/entities/rickandmorty.dart';

class RickandmortyModel extends RickAndMorty {
  RickandmortyModel({
    required int id,
    required String name,
    required String image,
  }): super(id: id, name: name, image: image);

  /*factory RickandmortyModel.fromJson(Map<String, dynamic>json){
    final url = json["url"];
    final parts = url.split('/');
    final id = int.parse(parts[parts.length - 2]);
    final img = " ";
    return RickandmortyModel(
      id: id,
      name: json["name"],
      image: img,
    );
  }*/
  factory RickandmortyModel.fromJson(Map<String, dynamic> json) {
    return RickandmortyModel(
      id: json['id'],              // directo
      name: json['name'],
      image: json['image'],        // imagen real
    );
  }
}