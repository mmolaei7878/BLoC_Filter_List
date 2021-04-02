part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetProductEvent extends ProductEvent {}

class FilterProductEvent extends ProductEvent {
  final String query;
  FilterProductEvent({@required this.query});
}
