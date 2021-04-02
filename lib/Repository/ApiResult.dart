import 'package:blocfilterlist/Model/ProductModel.dart';

class ApiResult {
  final List<ProductModel> list;
  ApiResult({this.list});
  ApiResult.fromJson(List list)
      : list = list.map((e) => ProductModel.fromJson(e)).toList();
}
