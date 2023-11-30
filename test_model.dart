class TestModel {
  TestModel({
      this.id, 
      this.name, 
      this.details,});

  TestModel.fromJson(dynamic json) {
    id = json['Id'];
    name = json['Name'];
    details = json['Details'];
  }
  int? id;
  String? name;
  String? details;
TestModel copyWith({  int? id,
  String? name,
  String? details,
}) => TestModel(  id: id ?? this.id,
  name: name ?? this.name,
  details: details ?? this.details,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Details'] = details;
    return map;
  }

}