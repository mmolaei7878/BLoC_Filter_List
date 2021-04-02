import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blocfilterlist/Model/ProductModel.dart';
import 'package:blocfilterlist/Repository/Repository.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final repository = Repository();

  List<ProductModel> listProduct;
  ProductBloc() : super(ProductInProgress());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetProductEvent) {
      yield* _mapGetProduct(event);
    } else if (event is FilterProductEvent) {
      yield* _mapFilterProduct(query: event.query);
    }
  }

  Stream<ProductState> _mapFilterProduct({@required String query}) async* {
    if (query == 'all') {
      final list = listProduct;
      yield ProductSucceed(list);
      return;
    }
    final list =
        listProduct.where((element) => element.category == query).toList();
    yield ProductSucceed(list);
  }

  Stream<ProductState> _mapGetProduct(
    GetProductEvent event,
  ) async* {
    try {
      listProduct = await repository.getProduct();
      yield ProductSucceed(listProduct);
    } catch (e) {
      yield ProductFailed();

      throw e;
    }
  }
}
