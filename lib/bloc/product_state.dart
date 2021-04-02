part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInProgress extends ProductState {}

class ProductSucceed extends ProductState {
  final List<ProductModel> list;
  ProductSucceed(this.list);
}

class ProductFailed extends ProductState {}
