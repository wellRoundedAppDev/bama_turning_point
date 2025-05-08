import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../categories/data/models/get_products_in_category_response.dart';

part 'product_filter_state.dart';

class ProductFilterCubit extends Cubit<ProductFilterState> {
  ProductFilterCubit() : super(ProductFilterInitial());
  static ProductFilterCubit get( context)=> BlocProvider.of(context);
  List<ProductInCategory>? products=[];

}
