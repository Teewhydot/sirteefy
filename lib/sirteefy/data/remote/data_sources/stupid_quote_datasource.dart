import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sirteefy/sirteefy/data/remote/models/stupid_quote_model.dart';
import 'package:sirteefy/sirteefy/domain/exceptions/custom_exceptions.dart';
import 'package:sirteefy/utils/other/misc.dart';


abstract class StupidQuoteDataSource {
  Future<AdviceModel> getStupidQuote();
}

class StupidQuoteAPIImpl implements StupidQuoteDataSource {
  @override
  Future<AdviceModel> getStupidQuote() async {
      final client = http.Client();
      final response = await client.get(Uri.parse('https://api.adviceslip.com/advice')).timeout(apiTImeOut, onTimeout: () => throw TimeoutException());
      if (response.statusCode != 200) {
        throw ServerException();
      }
      final responseBody = await jsonDecode(response.body);
      return AdviceModel.fromJson(responseBody);
  }
}
