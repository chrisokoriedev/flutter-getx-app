import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_tutorial/controller/cart_controller.dart';
import 'package:get_tutorial/controller/shopping_cart.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      CircleAvatar(
                                          child: Text(controller
                                              .products[index].productImage)),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        controller
                                            .products[index].productDescription,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    controller.products[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    color: Colors.blue,
                                    child: TextButton(
                                        onPressed: () =>
                                            cartController.addToCart(
                                                controller.products[index]),
                                        child: Text(
                                          'Add to cart',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }),
            ),
            SizedBox(
              height: 20,
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total Number\$${controller.totalPrice}',
                style: TextStyle(fontSize: 20),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.add_shopping_cart),
          label: GetX<CartController>(
            builder: (controller) {
              return Text(controller.count.toString());
            }
          )),
    );
  }
}
