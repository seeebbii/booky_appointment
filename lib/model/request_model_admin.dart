import 'package:booky/model/authentication/auth_model.dart';
import 'package:booky/model/provider_business_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RequestModelAdmin{
  String? docid;
 ProviderBusinessModel ?shop;
 AuthModel ? uid;
Timestamp ? createdAt;

  

  RequestModelAdmin({
    this.docid,
    this.shop,
    this.uid,
    this.createdAt,
    
  });

  RequestModelAdmin.fromDocumentSnapshot(Map<String, dynamic> doc) {
    try {
    docid=doc['docId'];
  // shop=doc['shop'];
   uid=AuthModel.fromDocumentSnapshot(doc['uid']);
   createdAt=doc['createdAt'];

      
  }
  catch (e)
  {

  }
 
}
//  Map<String, dynamic> toJson() => {
//     'docid':docid,
//       'shop': shop,
      
//       };
}

