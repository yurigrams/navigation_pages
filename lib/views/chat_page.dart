import 'package:flutter/material.dart';

import '../data/messages_data.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(padding: const EdgeInsets.all(8),
          child: CircleAvatar(),
        ),
        title: Text('Wildson'),
      ),
      body: ListView.builder(
        itemCount: chat["messages"].length,
        itemBuilder: (context, index) {
          return Align(
            alignment: chat["messages"][index]["sender"] == "Wildson" ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 6,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(chat["messages"][index]["message"]),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        chat["messages"][index]["created_at"],
                        style: TextStyle(
                            fontSize: 8
                        ),
                      ),
                      chat["messages"][index]['sender'] == "Wildson"
                      ? Icon(
                        Icons.check,
                        size: 10,
                        color: chat['messages'][index]['read'] ? Colors.blue : Colors.grey,
                      ) : SizedBox()
                    ],
                  ),
                ],
              ),

            ),
          );
        },
      ),
    );
  }
}
