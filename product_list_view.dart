import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../repositories/Product_repositore.dart';
import '../widget_drawer/custom_appbar.dart';
import '../widget_drawer/custom_drawer.dart';
import 'Update_Product_view.dart';
import 'add_product.dart';
import 'delete_product.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context),
      appBar: CustomAppbar("ViewProduct"),
      body: Container(
        child:FutureBuilder<List<ProductModel>>(
          future:ProductRepository().getAll(),
          builder:(context,snapchat){
            if(snapchat.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(snapchat.connectionState == ConnectionState.done){
              if(snapchat.hasError){
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }
              else if(snapchat.hasData){
                var list = snapchat.data ?? [];
                return RefreshIndicator(
                  onRefresh: ()async{
                    setState(() {

                    });
                  },

                  child: ListView.separated(
                      itemBuilder:(context,index){
                        return ListTile(
                          leading: Text("${list[index].id}"),
                          title: Text("${list[index].name},"
                              " ${list[index].price}"),
                          subtitle: Text("${list[index].details}"),

                            trailing:
                            SizedBox(
                                height: 20,
                                width: 100,
                                child:   Row(
                                  children: [
                                    IconButton(
                                      onPressed: ()async{
                                        var updaRes= await showDialog(context: context, builder: (context){
                                          print(list[index].id);
                                          // return UpdateStudentPage(Id: list[index].id??0,);
                                          return UpdateProductView(Product: list[index],);

                                        });
                                        if(updaRes !=null && updaRes ==true){
                                          setState(() {

                                          });
                                        }
                                      },
                                      icon:const Icon(
                                        Icons.edit,
                                        color: Colors.teal,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: ()async{
                                        var delRes= await showDialog(context: context, builder: (context){
                                          return DeleteProduct(itemid: list[index].id??0,);
                                        });
                                        if(delRes !=null && delRes ==true){
                                          setState(() {

                                          });
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),

                                    )
                                  ],
                                )
                            )
                        );

                      },
                      separatorBuilder: (context,index){
                        return Divider();

                      }, itemCount: list.length),
                );

              }

              else{
                return Center(child: Text("Erorr:${snapchat.error.toString()}"));

              }

            }

            else{
              return Center(child: Text("Erorr:${snapchat.error.toString()}"));

            }

          },  ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()async{
            var isAdd= await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddProduct()));
            if(isAdd !=null && isAdd ==true){
              setState(() {

              });
            }
          }),

    );
  }
}
