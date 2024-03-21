import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zinc_assignment/models/product.dart';
import 'package:zinc_assignment/views/screens/product_page.dart';
import 'package:zinc_assignment/viewmodels/product_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:zinc_assignment/views/ui/circular_progress.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);
    viewModel.fetchProducts();
    return Scaffold(
      appBar: AppBar(
        title: const Text('FakeStore App',
            style: TextStyle(fontWeight: FontWeight.w900)),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 20,
                ),
                itemCount: viewModel.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCard(viewModel.products[index], context);
                },
              ),
            );
          }
        },
      ),
    );
  }
}

Widget _buildCard(Product item, BuildContext context) {
  return Container(
    height: 200,
    width: double.maxFinite,
    decoration: BoxDecoration(
      color: const Color(0xFFD8D8D8),
      borderRadius: BorderRadius.circular(
        25,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            bottom: 15,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(product: item),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: CachedNetworkImage(
                    width: double.maxFinite,
                    height: 130.0,
                    fit: BoxFit.scaleDown,
                    imageUrl: item.image,
                    placeholder: (context, url) => const SizedBox(
                      width: 10,
                      height: 10,
                      child: CircularProgress(
                        width: 10,
                        height: 10,
                      ),
                    ),
                    errorWidget: (context, url, error) => Image.network(
                      'https://fakestoreapi.com/icons/logo.png',
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 5,
            left: 170,
            child: SizedBox(
              width: double.minPositive,
              child: Text(
                item.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Positioned(
            top: 145,
            right: 5,
            left: 170,
            child: SizedBox(
              width: double.minPositive,
              child: Text(
                '\$ ${item.price.toString()}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Positioned(
            top: 130,
            right: 8,
            child: OutlinedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductPage(product: item),
                  ),
                )
              },
              child: const Text('View',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
