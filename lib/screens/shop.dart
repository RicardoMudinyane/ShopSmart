import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {

  final List<String> _category = [
    'Mr Price',
    'Sportscene',
    'Edgars',
    'Refinery',
  ];

  final List<String> _categoryImage = [
    'https://www.waterfront.co.za/wp-content/uploads/2018/05/mrp.jpg',
    'https://foresthillcity.co.za/wp-content/uploads/2017/09/store-_0007s_0001_Sportscene.jpg',
    'https://www.waterfront.co.za/wp-content/uploads/2018/05/edgars.jpg',
    'https://wonderparkcentre.co.za/images/stores/refinery.jpg',
  ];

  @override
  Widget build(BuildContext context) {

    var _width = MediaQuery.of(context).size.width / 2;

    return Container(


        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: Text('Shops',
////                        style: Theme.of(context).textTheme.body1
//                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//                    ),
//                  ),
//                ],
//              ),
              GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: _category.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            width: _width,
                            height: _width - 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage(
                                image: NetworkImage(_categoryImage[index]),
                                fit: BoxFit.cover,
                                placeholder:
                                AssetImage('assets/images/loader.gif'),
                              ),
                            ),
                          ),
                        ),
                        Text(_category[index],
                            style: Theme.of(context).textTheme.body2,),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
