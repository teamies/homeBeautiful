import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_beautiful/models/product.dart';

class order{
  String? idOrder;
  List<product> products;
  num sumPrice;

  order({this.idOrder,required this.products, required this.sumPrice});

  factory order.fromJson(DocumentSnapshot doc){
    Map data = doc.data() as Map<String, dynamic>;
    return order(
      idOrder: doc.id,
        products: List<product>.from(data['products']),
      sumPrice: data['sumPrice']
    );
  }


}