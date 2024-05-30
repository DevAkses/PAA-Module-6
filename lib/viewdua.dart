import 'package:flutter/material.dart';
import 'package:module_6/model.dart';

class ViewDua extends StatelessWidget {
  final Cart cart;

  const ViewDua({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  cart.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                cart.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Price : " + cart.price.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),),
              Text("Discou : " + cart.discountPercentage.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),),
              Text(cart.discountedPrice.toString(),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
