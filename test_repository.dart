
import '../db/db_helper.dart';
import '../models/test_model.dart';

class TestRepository{
  Future<List<TestModel>> getAll()async{
    try{
      await Future.delayed(Duration(seconds: 1));
      var res = await DbHelper().getAll(DbTables.Tests);
      List<TestModel> list= [];
      if(res !=null){
        for( var item in res){
          list.add(TestModel.fromJson(item));
        }
      }
      return list;
    }
    catch(e){
      rethrow;

    }
  }

  Future<int> add(Map<String,dynamic>obj)async{
    try{
      await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().add(DbTables.Tests,obj);
      return res;

    }
    catch(e){
      return 0;
    }
  }
  Future<int> delete(int id)async{
    try{
      await Future.delayed(Duration(seconds: 1));
      //throw Exception();
      var res = await DbHelper().delete(DbTables.Tests,id);
      return res;

    }
    catch(e){
      return 0;
    }
  }

}







