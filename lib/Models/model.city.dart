class CityModel{
  int id;
  String name;

  CityModel({required this.id,required this.name});

  factory CityModel.fromJson(Map<String , dynamic> item){
    return CityModel(id: item["idCity"], name: item["name"]);
  }

  @override
  String toString() {
    return 'CityModel{id: $id, name: $name}';
  }
}