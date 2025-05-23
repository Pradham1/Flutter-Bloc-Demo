part of 'cart_bloc.dart';

@immutable
sealed class CartBlocState {}

abstract class CartActionState extends CartBlocState {}

final class CartBlocInitial extends CartBlocState {

}

class CartSuccessState extends CartBlocState {
  final List<ProductDataModel> cartItems;
  CartSuccessState({
    required this.cartItems
  });
}