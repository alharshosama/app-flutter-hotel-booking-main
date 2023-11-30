class ProductsModel {
  ProductsModel({
      this.id, 
      this.title, 
      this.price, 
      this.category, 
      this.description, 
      this.image,});

  ProductsModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
  }
  int? id;
  String? title;
  String? price;
  String? category;
  String? description;
  String? image;
ProductsModel copyWith({  int? id,
  String? title,
  String? price,
  String? category,
  String? description,
  String? image,
}) => ProductsModel(  id: id ?? this.id,
  title: title ?? this.title,
  price: price ?? this.price,
  category: category ?? this.category,
  description: description ?? this.description,
  image: image ?? this.image,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['category'] = category;
    map['description'] = description;
    map['image'] = image;
    return map;
  }

}