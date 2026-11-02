import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:session_2/CategoryModel.dart';
import 'package:session_2/SourceScreen.dart';
class Categoryscreen extends StatelessWidget {
   Categoryscreen({super.key});
  List<CategoryModel>categories = CategoryModel.getCategories();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.black,
        actions: [
          Icon(Icons.search,color: Colors.white,)
        ],
        centerTitle: true,
        title: Text("Home",style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning \n Here is Some News For You",style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w500
            ),),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>SourceScreen(
                    cat_id : categories[index].id
                    ) ,));
                  },
                    child: Image.asset("assets/images/category_images/${categories[index].image}.png"));
              }, separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ), itemCount: categories.length),
            )
          ],
        ),
      ) ,
    ) ;
  }
}
