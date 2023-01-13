import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PurchasingScreen extends StatefulWidget {
  const PurchasingScreen({super.key});

  @override
  State<PurchasingScreen> createState() => PurchasingScreenState();
}

class PurchasingScreenState extends State<PurchasingScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference stockRef = db.collection('stock');

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              StreamBuilder(
                stream: stockRef.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot stockSnapshot = snapshot.data!;
                    List<DocumentSnapshot> stock = stockSnapshot.docs;
                    return Flexible(
                      child: ListView.builder(
                          itemCount: stock.length,
                          itemBuilder: ((context, index) {
                            final record =
                                stock[index].data() as Map<String, dynamic>;
                            return InkWell(
                              onTap: () {
                                debugPrint('clicked on ${record["name"]}');
                              },
                              child: ListTile(
                                leading: const Icon(Icons.text_fields),
                                title: Text(
                                  '${record["name"]}',
                                ),
                              ),
                            );
                          })),
                    );
                  } else {
                    return const Text('no data');
                  }
                },
              ),
              const Text('purchase screen xxx'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Geri'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
