import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class PurchasingScreen extends StatefulWidget {
  const PurchasingScreen({super.key});

  @override
  State<PurchasingScreen> createState() => PurchasingScreenState();
}

class PurchasingScreenState extends State<PurchasingScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  late WebSocketChannel channel;

  @override
  void initState() {
    super.initState();
    channel = WebSocketChannel.connect(Uri.parse('ws://localhost:8080/ws'));
    channel.stream.listen(print);
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

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
                    return const Flexible(
                      child: Center(
                        child: Text('No data'),
                      ),
                    );
                  }
                },
              ),
              const Text('purchase screen xxx'),
              ElevatedButton(
                onPressed: () {
                  channel.sink.add('deneme mesaji');
                },
                child: const Text('WebSockete Mesaj Gönder'),
              ),
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
