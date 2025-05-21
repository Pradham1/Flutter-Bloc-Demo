part of 'home_bloc.dart';

@immutable
sealed class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {
  
}

class HomeProductWishlistButtonClickedEvent extends HomeBlocEvent {

}

class HomeProductCartButtonClickedEvent extends HomeBlocEvent {

}

class HomeWishlistButtonNavigateEvent extends HomeBlocEvent {

}

class HomeCartButtonNavigateEvent extends HomeBlocEvent {

}
