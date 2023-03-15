// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class ResetPasswordPage extends StatelessWidget {
//   final TextEditingController passwordController = TextEditingController();
//   final User user;

//   ResetPasswordPage(this.user);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Reset Password')),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: passwordController,
//               decoration: InputDecoration(
//                 labelText: 'New Password',
//                 hintText: 'Enter your new password',
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               child: Text('Reset Password'),
//               onPressed: () async {
//                 try {
//                   await user.updatePassword(passwordController.text);
//                   print("Mật khẩu đã được thay đổi thành công");
//                 } catch (e) {
//                   print("Lỗi khi cập nhật mật khẩu: $e");
//                 }  
//               }
//             )
//           ]
//         )
//       )
//     );
//   }
// }







import 'package:flutter/material.dart';

class ResetPasswordForm extends StatefulWidget {
  final String email;

  ResetPasswordForm({required this.email});

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password',
              ),
              validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
              },
            )
          ]
        )
      )
    );
  }
}