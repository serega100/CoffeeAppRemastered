import 'package:coffee_app_remastered/model/product/category.dart';
import 'package:coffee_app_remastered/model/product/product.dart';
import 'package:coffee_app_remastered/view/components/menu/product_container.dart';
import 'package:coffee_app_remastered/view/view_settings.dart';
import 'package:coffee_app_remastered/view/view_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryContainer extends StatelessWidget {
  final Category category;
  final List<Product> products;
  final void Function(Product) onProductAdded;

  const CategoryContainer({
    required this.category,
    required this.products,
    required this.onProductAdded,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.only(left: ViewSettings.pageTitleMargin.left),
          child: Text(
            category.title,
            style: GoogleFonts.montserrat(
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(height: 20),
        Wrap(
          runSpacing: 20.0,
          children: _getProductContainers(products),
        ),
      ],
    );
  }

  List<ProductContainer> _getProductContainers(List<Product> list) {
    var containers = <ProductContainer>[];
    for (var product in list) {
      var volume = product.volume;
      var units = product.volumeUnits;
      var volumeStr = ViewUtils.beautifyVolume(volume, units);

      containers.add(ProductContainer(
        image: product.image,
        title: product.title,
        volumeString: volumeStr,
        price: product.price,
        onAdded: () => onProductAdded(product),
      ));
    }

    return containers;
  }
}
