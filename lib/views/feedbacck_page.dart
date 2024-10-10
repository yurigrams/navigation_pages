import 'package:flutter/material.dart';
import 'package:navigation_pages/components/custom_input.dart';
import 'package:navigation_pages/services/firestore_service.dart';

class FeedbacckPage extends StatelessWidget {
  const FeedbacckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: 24,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(),
            title: Text('Yuri'),
            subtitle: Text('Lorem,Lorem,Lorem,Lorem,Lorem,Lorem,Lorem,Lorem,Lorem'),
            trailing: Text('10/10'),
        );
      },),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),),
              )
          ),
          Container(
            margin: EdgeInsets.symmetric( horizontal: 5),
            height: 53,
            child: ElevatedButton(onPressed: () async {
              await FirestoreService().postFeedback();
            },
              child: Icon(Icons.send)
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric( horizontal: 5),
            height: 53,
            child: ElevatedButton(onPressed: (){},
                child: Icon(Icons.mic)
            ),
          ),
        ],
      ),
    );
  }
}
