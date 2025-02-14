
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';

import '../../../domain/exceptions/custom_exceptions.dart';

abstract class SendMessageRemoteDataSource {
  Future<Success> sendMessage(String email, fullName, message);
}

class SendMessageFirebaseImplementation implements SendMessageRemoteDataSource {
  @override
  Future<Success> sendMessage(String email, fullName, message) async {
    final firestore = FirebaseFirestore.instance;
      await firestore.collection('messages').add({
        'email': email,
        'fullName': fullName,
        'message': message,
        'time': DateTime.now().toIso8601String()
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
        );
      });
      return MessageSentSuccess();
  }
}
