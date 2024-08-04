
import 'package:flex/data/model/product.dart';
import 'package:flex/widget/product.dart';
import 'package:flutter/cupertino.dart';

class ProductList extends StatelessWidget {
   const ProductList({super.key, required this.products});
  final List<Product> products ;
  @override 
  Widget build(BuildContext context) {
    return SizedBox(
      height: 820,
      child: GridView.builder(
        physics:NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
          itemCount: 6,
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            childAspectRatio: .7,
          ),
          itemBuilder: (context, index) {
            return  ProductItem(
              id: products[index].id ,
              discountPrice: products[index].discountPrice,
              dicount: products[index].discount,
              image:products[index].image,
              price: products[index].price,
              productName:products[index].title,
            );
          }),
    );
  }
}
