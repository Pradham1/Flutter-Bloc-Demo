import 'package:bloc_demo/features/cart/ui/cart.dart';
import 'package:bloc_demo/features/home/bloc/home_bloc.dart';
import 'package:bloc_demo/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeBlocState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {
        if(
          state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => Cart()));
        } else if(
          state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => Wishlist()));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(
              child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState: 
            return Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 67, 200, 167),
            title: Text("PD's Grocery App"),
            actions: [
              IconButton(
                onPressed: (){
                  homeBloc.add(HomeWishlistButtonNavigateEvent());
                }, 
                icon: Icon(Icons.favorite_border)),
              IconButton(
                onPressed: (){
                  homeBloc.add(HomeCartButtonNavigateEvent());
                }, 
                icon: Icon(Icons.shopping_cart)),
            ],
          ),
        );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error')
            )
          );
          default:
            return SizedBox();
        }
      },
    );
  }
}
