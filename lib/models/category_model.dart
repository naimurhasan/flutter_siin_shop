class Category{
  final String name;
  final int id;

  Category({required this.name,required  this.id});
  factory Category.fromJson(json) => Category(name: json["name"], id: json["id"]);
}