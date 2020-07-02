import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutteroverclone/components/my_app_bar.dart';
import 'package:flutteroverclone/models/category.dart';
import 'package:flutteroverclone/models/template.dart';
import 'package:flutteroverclone/constants/app_colors.dart';

final List<Category> _categories = [
  Category(title: "Pride", color: Color(0xFFD5BEEA)),
  Category(title: "Instagram\nStory", color: Color(0xFF6FDBC9)),
  Category(title: "Facebook\nPost", color: Color(0xFF5D83C7)),
  Category(title: "Pinterest", color: Color(0xFFFF5060)),
  Category(title: "Flyer/Poster", color: Color(0xFFD499E2)),
  Category(title: "Logo", color: Color(0xFF9692F7))
];

final List<Template> _templates = [
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: true),
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: true),
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: false),
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: false),
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: true),
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: false),
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: true),
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: false),
];

class TemplatesScreen extends StatefulWidget {
  @override
  _TemplatesScreenState createState() => _TemplatesScreenState();
}

class _TemplatesScreenState extends State<TemplatesScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Templates"),
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Container(
              height: 200,
              child: ListView.builder(
                itemCount: _categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    categoryItem(category: _categories[index]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: StaggeredGridView.countBuilder(
                scrollDirection: Axis.vertical,
                crossAxisCount: 4,
                itemCount: _templates.length,
                itemBuilder: (context, index) =>
                    templateItem(template: _templates[index]),
                staggeredTileBuilder: (index) =>
                    StaggeredTile.count(2, (index % 3) + 1),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget categoryItem({Category category}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(16.0),
      width: 170,
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          category.icon ??
              Icon(
                Icons.add,
                color: Colors.white,
              ),
          Text(
            category.title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget templateItem({Template template}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(template.image),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              template.isFree ? freeTag() : proTag(),
            ],
          ),
        ),
      ),
    );
  }

  Widget proTag() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.black.withAlpha(100),
            borderRadius: BorderRadius.circular(16.0)),
        child: Text(
          "PRO",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget freeTag() {
    return Positioned(
      left: -20,
      child: Align(
        alignment: Alignment.topLeft,
        child: Transform.rotate(
          angle: 100,
          child: Container(
            width: 150,
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            color: myYellow,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "FREE",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
