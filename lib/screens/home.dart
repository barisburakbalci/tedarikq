import 'package:flutter/material.dart';
import 'sales.dart';
import 'purchasing.dart';
import '../components/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const SalesScreen()),
                        ),
                      );
                    }),
                    child: const Text('Sales screen'),
                  ),
                  ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const PurchasingScreen()),
                        ),
                      );
                    }),
                    child: const Text('Purchasing screen'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(),
    );
  }
}
