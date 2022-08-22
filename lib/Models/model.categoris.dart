class CategoryModel {
  int id;
  String name;
  String description;
  String icon;

  CategoryModel(
      {required this.id,
        required this.name,
        required this.description,
        required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> item) {
    return CategoryModel(
        id: item["idCategory"],
        name:item["name"],
        description: item["description"],
        icon: item["icon"]);
  }


  @override
  String toString() {
    return 'CategoryModel{id: $id, name: $name, description: $description, icon: $icon}';
  }

  String adjustName(){
    return "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
  }
}
