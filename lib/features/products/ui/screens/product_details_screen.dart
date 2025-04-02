import 'package:ecommerce_crafty_bay/app/app_colors.dart';
import 'package:ecommerce_crafty_bay/core/extensions/localization_extension.dart';
import 'package:ecommerce_crafty_bay/features/products/ui/screens/review_screen.dart';
import 'package:ecommerce_crafty_bay/features/products/ui/widgets/color_picker.dart';
import 'package:ecommerce_crafty_bay/features/products/ui/widgets/increment_decrement_counter_widget.dart';
import 'package:ecommerce_crafty_bay/features/products/ui/widgets/product_image_carousel_slider.dart';
import 'package:ecommerce_crafty_bay/features/products/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localization.productDetails)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductImageCarouselSlider(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nike 320 2025 new edition',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Colors.orangeAccent,
                                          ),
                                          Text('4.2'),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, ReviewScreen.name);
                                        },
                                        child: const Text('Reviews'),
                                      ),
                                      Card(
                                        color: AppColors.themeColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
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
                            IncrementDecrementCounterWidget(
                              onChange: (int value) {
                                print(value);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ColorPicker(
                          colors: const ['Red', 'Green', 'Blue', 'White'],
                          onChange: (selectedColor) {
                            print(selectedColor);
                          },
                        ),
                        const SizedBox(height: 16),
                        SizePicker(
                          sizes: const ['S', 'M', 'L', 'XL'],
                          onChange: (selectedSize) {
                            print(selectedSize);
                          },
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '''The quick brown fox jumps over the lazy dog. Abstract ideas are furiously sleeping for a moment.  Green thoughts wander into a land of time.''',
                        style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(),
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withValues(alpha: 0.15),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price'),
              Text(
                '\$1000',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.themeColor),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}
