import 'package:module_6/provider.dart';
import 'package:module_6/viewdua.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ViewSatu extends StatelessWidget {
  const ViewSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider()..fetchData(),
      child: Scaffold(
         appBar: AppBar(
        title: Text('Product'),
      ),
        body: Consumer<CartProvider>(
          builder: (context, provider, _) {
            print(provider.cart);
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (provider.cart.isEmpty) {
              return Center(child: Text('No data available'));
            }
            return ListView.builder(
              itemCount: provider.cart.length,
              itemBuilder: (context, index) {
                final cart = provider.cart[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 4.0),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewDua(cart: cart),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              cart.thumbnail,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cart.title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
