import 'package:bloc/bloc.dart';
import 'package:connie_stylish/model/model/product.dart';
import 'package:connie_stylish/model/model/product_category.dart';
import 'package:connie_stylish/model/repository/ProductRepository.dart';

import 'home_product_list_state.dart';

class HomeProductListCubit extends Cubit<DataCubitState> {
  final ProductRepository _repository;
  List<CategoryProduct> productList = [];

  HomeProductListCubit(ProductRepository repository)
      : _repository = repository,
        super(const LoadingState());

  Future<void> fetch(List<ProductCategory> categories) async {
    try {
      List<CategoryProduct> results = [];
      for (var category in categories) {
        CategoryProduct categoryProduct = CategoryProduct(
          name: category.name,
          products: await _repository.fetchProducts(category),
        );
        results.add(categoryProduct);
      }
      productList = results;
      emit(const SuccessState());
    } catch (e) {
      emit(const ErrorState(""));
    }
  }
}
