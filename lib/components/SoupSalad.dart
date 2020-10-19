import 'package:flutter/material.dart';
import 'DetailPage.dart';
import 'menu_list.dart';

class SoupSalad extends StatelessWidget {
  List<Menu> soupsalad =
  menus.where((i) => (i.key.substring(0, 2) == 'ss')).toList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              Menu menu = soupsalad[index];
              return Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(
                            menu: menu,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            width: 180.0,
                            height: 180.0,
                            image: AssetImage(
                              menu.imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(menu.name),
                    Text('\$${menu.price}'),
                  ],
                ),
              );
            },
            childCount: soupsalad.length,
          ),
        ),
      ],
    );
  }
}
