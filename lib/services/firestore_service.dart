import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navigation_pages/services/auth_service.dart';

class FirestoreService{

  var db = FirebaseFirestore.instance;


  postFeedback() async{
    db.collection('Feedbacks').add({
      "user":await FireAuthService().checkUser(),
      "message":"Implemento Firebase",
      "Photo":"",
      "created_al":DateTime.now()
    });
  }
}