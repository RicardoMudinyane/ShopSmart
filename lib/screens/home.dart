import 'package:flutter/material.dart';
import 'package:shop_smart/widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shop_smart/screens/wallpaper.dart';


class MainPage extends StatelessWidget {

  final List<String> _trendingImages = [
    'https://sneakerbardetroit.com/wp-content/uploads/2019/04/nike-air-force-1-low-flyknit-oreo-official-release-dates-2019-thumb.jpg',
    'http://www.sherrirollins.ca/images/en/New-Adidas-Neo-Energy-Cloud-2-Womens-Shoes-Active-Sneakers-Active.jpg',
    'https://img.staticbg.com/thumb/large/oaupload/banggood/images/36/87/3caddeee-108d-444f-ad97-ba00fe6fb703.jpg',
    'https://www.modells.com/dw/image/v2/BBXB_PRD/on/demandware.static/-/Sites-master-catalog/default/dw42f7ad61/images/large/0000002018/PRESFCAP_1.jpg?sw=388&sh=388&sm=fit',
    'https://cdn.fashiola.com/L433036885/adidas-men-caps-mens-superlite-climalite-cap.jpg'

  ];
  final List<String> _popularImages = [
    'https://images.pexels.com/photos/990826/pexels-photo-990826.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1227497/pexels-photo-1227497.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/1493378/pexels-photo-1493378.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.pexels.com/photos/35857/amazing-beautiful-breathtaking-clouds.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://images.unsplash.com/photo-1507608616759-54f48f0af0ee?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
    'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?cs=srgb&dl=burrito-chicken-close-up-461198.jpg&fm=jpg'
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Container(

      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            ShowMore(text: 'Trending', onTap: () {}),
            CarouselSlider(
              autoPlay: true,
              height: 200.0,
              items: _trendingImages.map((index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WallpaperPage(
                                      heroId: 'trending$index',
                                      imageUrl: index,
                                      themeData: _themeData,
                                    )));
                          },
                          child: Hero(
                            tag: 'trending$index',
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: FadeInImage(
                                  image: NetworkImage(index),
                                  fit: BoxFit.cover,
                                  placeholder:
                                  AssetImage('assets/images/loading.gif'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            ShowMore(text: 'Popular', onTap: () {}),
            ListView.builder(
              itemCount: _popularImages.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WallpaperPage(
                                heroId: 'popular$index',
                                imageUrl: _popularImages[index],
                                themeData: _themeData,
                              )));
                    },
                    child: Hero(
                      tag: 'popular$index',
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: FadeInImage(
                            image: NetworkImage(_popularImages[index]),
                            fit: BoxFit.cover,
                            placeholder:
                            AssetImage('assets/images/loading.gif'),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
