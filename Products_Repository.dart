import 'package:dio/dio.dart';

import '../models/Products_model.dart';

class ProductsRepository{
 late Dio dio;

 ProductsRepository(){
   dio=Dio();
   dio.options.connectTimeout=Duration(seconds: 10);
   dio.options.responseType=ResponseType.json;


 }
 Future<List<ProductsModel>> getAll() async {
   try {
     await Future.delayed(Duration(seconds: 1));
     var res = await dio.get('https://fakestoreapi.com/products');
     List<ProductsModel> list = [];
     if (res.statusCode==200) {
       var data = res.data as List;
       if (data.isNotEmpty) {
         for (var item in data) {
           list.add(ProductsModel.fromJson(item));
         }
       }
     }
     return list;
   }
   catch (e) {
     rethrow;
   }
 }

// Future<int> add(Map<String, dynamic>obj) async {
//   try {
//     await Future.delayed(Duration(seconds: 1));
//     //throw Exception();
//     var res = await DbHelper().add(DbTables.Products, obj);
//     return res;
//   }
//   catch (e) {
//     return 0;
//   }
// }
}