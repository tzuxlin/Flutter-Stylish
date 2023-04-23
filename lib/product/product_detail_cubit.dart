import 'package:bloc/bloc.dart';
import 'package:connie_stylish/home/product_list/home_product_list_state.dart';

import '../model/model/product.dart';
import '../model/repository/product_repository.dart';


class ProductDetailCubit extends Cubit<DataCubitState> {

  final ProductRepository _repository;
  late ProductDetail product;

  ProductDetailCubit(ProductRepository repository)
      : _repository = repository,
        super(const LoadingState());

  Future<void> fetch(int id) async {
    try {
      product = await _repository.fetchProductDetail(id);
      emit(const SuccessState());
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

}
