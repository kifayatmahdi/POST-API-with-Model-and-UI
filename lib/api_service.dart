import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class ApiService {
  final String url = "https://jsonplaceholder.typicode.com/posts";

  Future<bool> createPost(PostModel pst) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(pst.toJsn()),
      );

      // 201 Created is the expected success code for POST create
      if (response.statusCode == 201) {
        return true;
      } else {
        // You can log response.body here to inspect server error message
        return false;
      }
    } catch (e) {
      // Network error, timeout, or other exception
      // You can rethrow or return false depending on your app design
      return false;
    }

  }
}

