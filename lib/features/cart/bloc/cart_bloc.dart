import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/data/cart_items.dart';
import 'package:bloc_demo/features/home/models/home_prodcut_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }
}
