import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/cart_items.dart';
import 'package:bloc_demo/data/grocery_data.dart';
import 'package:bloc_demo/data/wishlist_items.dart';
import 'package:bloc_demo/features/home/models/home_prodcut_data_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }
  
  FutureOr<void> homeInitialEvent(
    HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 2));
      emit(HomeLoadedSuccessState(
        products: GroceryData.groceryList.map((e) => ProductDataModel(
          id: e['id'], 
          name: e['name'], 
          price: e['price'], 
          quantity: e['quantity'], 
          category: e['category'],
          image: e['image'],
        )
        ).toList(),
        )
      );
    }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event, Emitter<HomeBlocState> emit) {
      print('Wishlist product clicked');
      wishlistItems.add(event.clickedProduct);
      emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event, Emitter<HomeBlocState> emit) {
      print('Cart product clicked');
      cartItems.add(event.clickedProduct);
      emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
    HomeWishlistButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
      print('Navigate to Wishlist');
      emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
    HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
      print('Navigate to Cart');
      emit(HomeNavigateToCartPageActionState());
  }
}
