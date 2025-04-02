import 'package:ecommerce_crafty_bay/app/app_colors.dart';
import 'package:ecommerce_crafty_bay/app/assets_path.dart';
import 'package:ecommerce_crafty_bay/features/products/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name);
      },
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 140,
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withValues(alpha: 0.15),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: const DecorationImage(
                    image: AssetImage(AssetsPath.shoePng),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      'Nike NK76 - new collection',
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '100৳',
                          style: TextStyle(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.orangeAccent,
                            ),
                            Text('4.2'),
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
