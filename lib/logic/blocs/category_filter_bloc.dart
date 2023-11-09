// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';

// import '../data/item_data.dart';
// import '../models/item.dart';

// // Define the events that the bloc can handle
// abstract class CategoryFilterEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class FilterCategory extends CategoryFilterEvent {
//   final String categoryTitle;

//   FilterCategory(this.categoryTitle);

//   @override
//   List<Object?> get props => [categoryTitle];
// }

// class CategoryFilterBloc extends Bloc<CategoryFilterEvent, List<ProductItem>> {
//   final List<ProductItem> allProducts = dummyProductItems;

//   CategoryFilterBloc(super.initialState);

//   @override
//   Stream<List<ProductItem>> mapEventToState(CategoryFilterEvent event) async* {
//     if (event is FilterCategory) {
//       // Filter products based on the selected category
//       yield allProducts.where((product) => product.categoryTitle == event.categoryTitle).toList();
//     }
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanka_derana/data/models/item.dart';

/// Event being processed by [CategoryFilterBloc].
abstract class CategoryFilterEvent {}

/// Notifies bloc to increment state.
class filterByCategory extends CategoryFilterEvent {}

/// Notifies bloc to decrement state.
class filterBySubCategory extends CategoryFilterEvent {}

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class CategoryFilterBloc extends Bloc<CategoryFilterEvent, List<ProductItem>> {
  /// {@macro counter_bloc}
  CategoryFilterBloc() : super([]) {
    on<filterByCategory>((event, emit) {
      
    },);
    on<filterBySubCategory>((event, emit) {
      
    },);
  }
}
