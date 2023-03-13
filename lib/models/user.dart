// import 'package:cloud_firestore/cloud_firestore.dart';

// class USER{
//   String? id;
//   String name;
//   String email;
//   String password;

//   USER(
//       {this.id,
//         required this.email,
//         required this.name,
//         required this.password,
//       });

//   factory USER.fromFirestore(DocumentSnapshot doc)
//   {
//     Map data = doc.data() as Map<String, dynamic>;
//     return USER(
//         id: doc.id,
//         email : data['email'],
//         name : data['name'],
//         password : data['password'],
//     );
//   }

//   Map<String, dynamic> toFirestore() {
//     return {
//       'id': id,
//       'name':name,
//       'email':email,
//       'password': password,
//     };
//   }
// }


