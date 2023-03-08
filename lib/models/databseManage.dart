import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_beautiful/models/product.dart';

class databaseManage{
  final CollectionReference products = FirebaseFirestore.instance.collection('product') ;

  Future getProduct() async{
    // try{
    //   List<product> itemProduct = [];
    //   products.get().then((snapshot) => {
    //     snapshot.docs.forEach((doc)
    //     =>  product.fromFirestore(doc)).
    //   });
    //   return itemProduct;
    // }
    // catch(e){
    //   return null;
    // }

    QuerySnapshot querySnapshot = await products.get();
    return querySnapshot.docs.map((e) => product.fromFirestore(e)).toList();
  }

  Future updateProduct(String docID, Map<String, dynamic> data) async{
    DocumentReference documentReference = products.doc(docID) ;
    await documentReference.set(data);
  }

   Future createProduct(String name, String content, String image, String type, num price, num quatity, num star,  ) async{
     return await products.doc().set({'id': DateTime.now(), 'name': name, 'content': content, 'image':image, 'type':type,'price':price, 'quatity':quatity, 'star':star} );
}

}