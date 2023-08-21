import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import '../models/category_model.dart';

class MyHomePage extends StatefulWidget{
  @override

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  List<CategoryModel>categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,                        //to remove the line or shadow of the app bar to make app look more sick
        backgroundColor: Colors.white,      //color the app bar background 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,      //centering the text of the row
          children: [
            Text("Malaysia", style: TextStyle(color: Color.fromARGB(255, 106, 103, 103)),),
            Text("News", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
          ],
        ),
      ),

      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length, 
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => CategoryTile(
                  imageUrl: categories[index].imageUrl,
                  categoryName: categories[index].categoryName,
                ))),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final dynamic imageUrl, categoryName;
  const CategoryTile({Key? key, this.imageUrl, this.categoryName}) : super(key: key);
  
  

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget> [
            ClipRRect(                    //it clips it child's widget to round rectangle shape
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, 
              width: 120, 
              height: 80, 
              fit: BoxFit.cover,),
            ),
            Container(
              alignment: Alignment.center,
              width: 120, 
              height: 80,
              decoration: BoxDecoration(                    //to make the picture darker, it stacks a dark box on the images
                borderRadius: BorderRadius.circular(12),
                color: Colors.black26
              ),
              child: Text(categoryName, style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500),),
            )
          ],
        ),
      ),
    );
  }
}


class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  const BlogTile({ Key? key, required this.imageUrl, required this.title, required this.desc }) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
