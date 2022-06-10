class CategoriesModel {
  int id;
  String name;
  String description;
  String icon;

  CategoriesModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.icon});

  factory CategoriesModel.fromJson(Map<String, dynamic> item) {
    return CategoriesModel(
        id: item["idCategory"],
        name:item["name"],
        description: item["description"],
        icon: item["icon"]);
  }


  String adjustName(){
    return "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
  }
}
