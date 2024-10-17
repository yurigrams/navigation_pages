import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navigation_pages/components/custom_input.dart';
import 'package:navigation_pages/services/firestore_service.dart';

class FeedbacckPage extends StatefulWidget {
   FeedbacckPage({super.key});

  @override
  State<FeedbacckPage> createState() => _FeedbacckPageState();
}

class _FeedbacckPageState extends State<FeedbacckPage> {
  TextEditingController messageController = TextEditingController();

  var feedbacks;

  @override
  void initState(){
    //TODO: implement initState
    feedbacks = FirestoreService().getFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedbacks'),
      ),
      body: RefreshIndicator(
        onRefresh: ()  async {
          setState(() {
            feedbacks = FirestoreService().getFeedback();
          });
        },
        child: FutureBuilder(
          future: feedbacks,
          builder: (context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return
            ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Timestamp date = snapshot.data[index]['created_al'];
                var formatDate = DateFormat('dd/MM').format(date.toDate());
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text(snapshot.data[index]['user'].toString()),
                  subtitle: Text(snapshot.data[index]['message'].toString()),
                  trailing: Text(formatDate),
                );
              },
            );
          }
        },),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: messageController,
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
              await FirestoreService().postFeedback(messageController.text);
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
