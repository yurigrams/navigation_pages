import 'package:flutter/material.dart';
import 'package:navigation_pages/services/get_users.dart';

import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(12, (index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 45,
                    ),
                  );
                }),
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: getUsers(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        return GridView.builder(
                            itemCount: snapshot.data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.85,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage(
                                              user: snapshot.data[index])));
                                  getUsers();
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(
                                            snapshot.data[index]['image']),
                                      ),
                                      Text(
                                        snapshot.data[index]['firstName'],
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(snapshot.data[index]['company']
                                          ['title'])
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }))
          ],
        ));
  }
}
