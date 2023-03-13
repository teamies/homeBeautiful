
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }


  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }


  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");

  // saving the userdata
  Future savingUserData({ required String name, required String password, required String ConfirmPassword, required String email}) async {
    return await userCollection.doc(email).set({
      'name' : name,
      "password": password,
      "ConfirmPassword": ConfirmPassword,
      "email": email,
      "uid": email,
    });
  }


  // getting user data
  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}