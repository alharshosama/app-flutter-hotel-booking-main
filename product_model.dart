class ProductModel {
  ProductModel({
      this.id,
      this.name, 
      this.price, 
      this.details,});

  ProductModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    price = json['Price'];
    details = json['Details'];
  }
  int? id;
  String? name;
  dynamic? price;
  String? details;
ProductModel copyWith({  int? id,
  String? name,
  int? price,
  String? details,
}) => ProductModel(  id: id ?? this.id,
  name: name ?? this.name,
  price: price ?? this.price,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Price'] = price;
    map['Details'] = details;
    return map;
  }

}