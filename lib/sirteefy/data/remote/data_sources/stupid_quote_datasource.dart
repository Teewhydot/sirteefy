import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:sirteefy/sirteefy/data/remote/models/stupid_quote_model.dart';
import 'package:sirteefy/sirteefy/domain/exceptions/custom_exceptions.dart';
import 'package:sirteefy/utils/other/misc.dart';

abstract class StupidQuoteDataSource {
  Future<QuoteModel> getStupidQuoteFromDataSource();
}

class StupidQuoteAPIImpl implements StupidQuoteDataSource {
  @override
  Future<QuoteModel> getStupidQuoteFromDataSource() async {
    final client = http.Client();
    final response = await client
        .get(Uri.parse('https://api.adviceslip.com/advice'))
        .timeout(apiTImeOut, onTimeout: () => throw TimeoutException());
    if (response.statusCode != 200) {
      throw ServerException();
    }
    final responseBody = await jsonDecode(response.body);
    return QuoteModel.fromJson(responseBody);
  }
}

class StupidQuoteFirebaseImpl implements StupidQuoteDataSource {
  @override
  Future<QuoteModel> getStupidQuoteFromDataSource() async {
    final fireStore = FirebaseFirestore.instance;
    dynamic jsonResponse;
    await fireStore
        .collection('StupidQuote')
        .doc('stupid_quote')
        .get()
        .then((value) {
          jsonResponse = value;
    }).timeout(apiTImeOut, onTimeout: () {
      throw TimeoutException();
    });
    return QuoteModel.fromFirebaseDoc(jsonResponse);
  }
}
