import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_beautiful/models/cart.dart';
import 'package:home_beautiful/models/product.dart';
import 'package:home_beautiful/screens/my_cart.dart';

class databaseManage{
  final  products = FirebaseFirestore.instance.collection('product') ;
  final  carts = FirebaseFirestore.instance.collection('cart');
  

  // Future getProduct() async{
  //   final query = await products.get();
  //   return query.docs.map((e) => product.fromFirestore(e)).toList();
  // }

  Stream<List<product>> getProduct() {
    return products.snapshots().map((querySnapshot) {
      return querySnapshot.docs.map((doc) => product.fromFirestore(doc)).toList();
    });
  }

  Future updateProduct(String docID, Map<String, dynamic> data) async{
    final document = products.doc(docID) ;
    await document.set(data);
  }

  Stream<List<cart>> getCart() async* {
    final queryProduct = await products.get();
    final queryCart = carts.where('idProduct', isNotEqualTo: '').snapshots();

    await for (final snapshot in queryCart) {
      final listCart = snapshot.docs.map((doc) {
        final id_Product = doc['idProduct'];
        final product = queryProduct.docs.firstWhere((element) => element.id == id_Product);
        return cart(
          id: doc.id,
          idProduct: doc['idProduct'],
          quantity: doc['quantity'],
          name: product['name'],
          price: product['price'],
          image: product['image'],
        );
      }).toList();
      yield listCart;
    }
  }


  Future createCart(cart Carts) async{
    await carts.add(Carts.toJson());
  }

  Future updateCart(String docID, Map<String, dynamic> data) async{
    final document = await carts.doc(docID);
    await document.set(data);
  }

  Future deleteCart(String docID) async{
    final document = await carts.doc(docID);
    await document.delete();
  }


}

