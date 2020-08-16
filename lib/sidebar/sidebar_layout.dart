import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation_bloc.dart';
import 'sidebar.dart';


/*

This is the class that is called in main when the app first loads.
It is a Stack with the BlocBuilder first in the stack and the Sidebar second so
the pages are always underneath the sidebar. 
Currently the sidebar is always visible but we can change this.

The BlocBuilder is the mechanism which changes the underlying page.
Bloc is a form of Flutter state management. Managing state is very important in
mobile apps. We can use a different form of state managemt in the future.

*/
class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack(
          children: <Widget>[
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar(),
          ],
        ),
      ),
    );
  }
}