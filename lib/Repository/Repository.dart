import 'package:blocfilterlist/Model/ProductModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'ApiResult.dart';

class Repository {
  Future<List<ProductModel>> getProduct() async {
    final url = 'https://fakestoreapi.herokuapp.com/products';
    final response = await http.get(Uri.parse(url));
    final data = (json.decode(response.body));
    final List<ProductModel> list = ApiResult.fromJson(data).list;
    return list;
  }
}
