import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBloc() : super(WishlistBlocInitial()) {
    on<WishlistBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
