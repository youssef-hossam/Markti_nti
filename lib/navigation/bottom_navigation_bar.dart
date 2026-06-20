import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/home/home_view.dart';
import 'package:marketi_nti/locator.dart';
import 'package:marketi_nti/profile/profile_cubit/profile_cubit.dart';
import 'package:marketi_nti/profile/profile_view.dart';

class BottomNavBar extends StatefulWidget {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    Center(child: Text("Cart View")),
    Center(child: Text("Favorites View")),
    BlocProvider(
      create: (context) => ProfileCubit(apiConsumer: getIt<ApiConsumer>())..getCurruntUserInfo(),
      child: ProfileView(),
    ),
  ];

  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            widget._currentIndex = value;
          });
          // Handle navigation logic here based on the selected index
          print('Selected index: ${widget._currentIndex}');
        },
        selectedItemColor: Colors.blue,
        currentIndex: widget._currentIndex,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: widget._pages[widget._currentIndex],
    );
  }
}
