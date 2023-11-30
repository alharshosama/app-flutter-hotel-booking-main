//
//
//
// import '../db/db_helper.dart';
// import '../models/product_model.dart';
//
// class ProductRepository{
//   Future<List<ProductModel>> getAll()async{
//     try{
//       await Future.delayed(Duration(seconds: 1));
//       var res = await DbHelper().getAll(DbTables.Products);
//       List<ProductModel> list= [];
//       if(res !=null){
//         for( var item in res){
//           list.add(ProductModel.fromJson(item));
//         }
//       }
//       return list;
//     }
//     catch(e){
//       rethrow;
//
//     }
//   }
//
//   Future<int> add(Map<String,dynamic>obj)async{
//     try{
//       await Future.delayed(Duration(seconds: 1));
//       //throw Exception();
//       var res = await DbHelper().add(DbTables.Products,obj);
//       return res;
//
//     }
//     catch(e){
//       return 0;
//     }
//   }
//   Future<int> delete(int id)async{
//     try{
//       await Future.delayed(Duration(seconds: 1));
//       //throw Exception();
//       var res = await DbHelper().delete(DbTables.Products,id);
//       return res;
//
//     }
//     catch(e){
//       return 0;
//     }
//
//   }
//   Future<int> update(int id)async{
//     try{
//       await Future.delayed(Duration(seconds: 1));
//       //throw Exception();
//       var res = await DbHelper().update(DbTables.Products,id as Map<String, dynamic>);
//       return res;
//
//     }
//     catch(e){
//       return 0;
//     }
//
// }
//
//





import '../db/db_helper.dart';
import '../models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> getAll() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      var res = await DbHelper().getAll(DbTables.Products);
      List<ProductModel> list = [];
      if (res != null) {
        for (var item in res) {
          list.add(ProductModel.fromJson(item));
        }
      }
      return list;
    }
    catch (e) {
      rethrow;
    }
  }

  Future<int> add(Map<String, dynamic>obj) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().add(DbTables.Products, obj);
      return res;
    }
    catch (e) {
      return 0;
    }
  }

  Future<int> delete(int id) async {
    try {
      await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().delete(DbTables.Products, id);
      return res;
    }
    catch (e) {
      return 0;
    }
  }

  Future<int> update(Map<String,dynamic>obj)async{
    try{
       await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().update(DbTables.Products,obj);

      return res;

    }
    catch(e){
      print('dbhelper is ${e}');
      return 0;
    }
  }


}
