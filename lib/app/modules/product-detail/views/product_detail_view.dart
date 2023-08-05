import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../components/product_detail_components.dart';
import 'package:get/get.dart';
import 'package:shamo/app/style.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../controllers/product_detail_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        bottomNavigationBar: addToCartButton(controller: controller),
        appBar: AppBar(
          backgroundColor: transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 25,
              color: bg1,
            ),
            onPressed: () {
              Get.offAndToNamed('/main');
            },
          ),
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/black_cart_icon.png',
                width: 20,
              ),
              onPressed: () {
                Get.toNamed('/cart');
              },
            ),
          ],
        ),
        body: SlidingUpPanel(
          controller: controller.panelController,
          minHeight: Get.height * .65,
          maxHeight: Get.height - 80,
          borderRadius: BorderRadius.circular(24),
          onPanelClosed: () => controller.isPanelClosed.value = true,
          onPanelOpened: () => controller.isPanelClosed.value = false,
          parallaxEnabled: true,
          backdropEnabled: true,
          panel: Container(
              decoration: const BoxDecoration(
                color: bg1,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Obx(
                () => Column(
                  children: [
                    title(controller: controller),
                    priceBox(),
                    descriptionBox(controller: controller),
                    similarShoes(controller: controller),
                  ],
                ),
              )),
          body: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: Get.height * .4,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                ),
                items: controller.product.galleries!.map<Widget>((gallery) {
                  return Container(
                    width: double.infinity,
                    height: Get.height * .4,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(gallery.url.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
