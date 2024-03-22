import 'dart:convert';
// ignore: library_prefixes
import 'package:http/http.dart' as Http;
import 'package:http/http.dart';


class BooksProvider{
  searchBookByText(String text) async {
    Response httpResponse = await Http.get(Uri.parse("https://api.itbook.store/1.0/search/$text"));
    if(httpResponse.statusCode == 200){
      final response = json.decode(utf8.decode(httpResponse.bodyBytes));
      return response;
    }
    return null;
  }


  searchBookById(String id) async {
    Response httpResponse = await Http.get(Uri.parse("https://api.itbook.store/1.0/books/$id"));
    if (httpResponse.statusCode == 200) {
      final response = json.decode(utf8.decode(httpResponse.bodyBytes));
      return response;
    }
    return null;
  }
}