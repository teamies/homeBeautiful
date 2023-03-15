
import 'package:cloud_firestore/cloud_firestore.dart';

class cart{
  String? id;
  String idProduct;
  num? price;
  String? name;
  String? image;
  num quantity;
  cart({ this.id, required this.idProduct, this.name, this.price,  this.image, required this.quantity});

  factory cart.fromJson(DocumentSnapshot doc ) {
    Map data = doc.data() as Map<String, dynamic>;
    return cart(
        id: doc.id,
        idProduct: data['idProduct'],
        price: data['price'],
        name: data['name'],
        image: data['image'],
        quantity: data['quantity'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'idProduct': idProduct,
      'quantity': quantity
    };
  }


}



