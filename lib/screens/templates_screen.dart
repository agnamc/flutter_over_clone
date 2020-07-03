import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutteroverclone/components/my_app_bar.dart';
import 'package:flutteroverclone/models/category.dart';
import 'package:flutteroverclone/models/template.dart';
import 'package:flutteroverclone/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<Category> _categories = [
  Category(
      title: "Pride",
      color: Color(0xFFD5BEEA),
      icon: FaIcon(FontAwesomeIcons.rainbow, color: Colors.white)),
  Category(
      title: "Instagram\nStory",
      color: Color(0xFF6FDBC9),
      icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.white)),
  Category(
      title: "Facebook\nPost",
      color: Color(0xFF5D83C7),
      icon: FaIcon(FontAwesomeIcons.facebookSquare, color: Colors.white)),
  Category(
      title: "Pinterest",
      color: Color(0xFFFF5060),
      icon: FaIcon(FontAwesomeIcons.pinterest, color: Colors.white)),
  Category(
      title: "Flyer/Poster",
      color: Color(0xFFD499E2),
      icon: FaIcon(FontAwesomeIcons.fileAlt, color: Colors.white)),
  Category(
      title: "Logo",
      color: Color(0xFF9692F7),
      icon: FaIcon(FontAwesomeIcons.solidStar, color: Colors.white)),
];

final List<Template> _templates = [
  Template(
      image:
          "https://besthqwallpapers.com/Uploads/16-9-2019/104231/thumb2-dark-abstract-background-neon-lines-dark-lines-background-creative-abstraction-geometric-backgrounds.jpg",
      isFree: true),
  Template(
      image:
          "https://images.assetsdelivery.com/compings_v2/shotsstudio/shotsstudio1506/shotsstudio150600050.jpg",
      isFree: true),
  Template(
      image:
          "https://image.freepik.com/free-vector/colorful-abstract-wallpaper-design_23-2148467625.jpg",
      isFree: false),
  Template(
      image:
          "https://cellularnews.com/wp-content/uploads/2020/03/Abstract-3-325x485.jpg",
      isFree: false),
  Template(
      image:
          "https://cdn.dribbble.com/users/20956/screenshots/6644524/attachments/1420193/psych-abstract-wallpaper-tablet-2662x2662.png",
      isFree: true),
  Template(image: "https://wallpaperaccess.com/full/357699.jpg", isFree: false),
  Template(
      image:
          "https://png.pngtree.com/thumb_back/fw800/background/20190627/pngtree-elegant-abstract-wallpaper-design-image_262927.jpg",
      isFree: true),
  Template(
      image:
          "https://images.hdqwalls.com/wallpapers/twitz-color-abstract-se.jpg",
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
    var _tabs = ["Tab 1", "Tab 2"];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              flexibleSpace: MyAppBar(title: "Templates"),
              bottom: PreferredSize(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none),
                  ),
                ),
                preferredSize: Size(100, 60),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 8.0),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: StaggeredGridView.countBuilder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 4,
                    itemCount: _templates.length,
                    itemBuilder: (context, index) =>
                        templateItem(template: _templates[index]),
                    staggeredTileBuilder: (index) =>
                        StaggeredTile.count(2, (index % 3) + 1),
                  ),
                )
              ],
            ),
          ),
        ),
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
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(template.image),
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
