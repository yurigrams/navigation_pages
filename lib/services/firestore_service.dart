import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navigation_pages/services/auth_service.dart';

class FirestoreService{

  var db = FirebaseFirestore.instance;


  postFeedback(message) async{
    db.collection('Feedbacks').add({
      "user":await FireAuthService().checkUser(),
      "message":message,
      "Photo":"",
      "created_al":DateTime.now()
    });
  }
  getFeedback() async{
    try {
      var feedbacks = await db.collection('Feedbacks').orderBy('created_al', descending: true).get();
      return feedbacks.docs;
    } catch (e) {
      throw e;
    }
  }
}
