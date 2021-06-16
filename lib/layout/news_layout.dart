import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/search/search_scareen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var _cubit = NewsCubit.get(context);
        return Scaffold(
          body: _cubit.screens[_cubit.currentIndex],
          appBar: AppBar(
            title: Text('News app'),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                icon: Icon(Icons.brightness_2),
                onPressed: () {
                  NewsCubit.get(context).changeAppMode();
                  print('DONE CHANGE COLOR ');
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _cubit.currentIndex,
            onTap: (index) => _cubit.changeBottomNavBar(index),
            items: _cubit.bottomItems,
          ),
        );
      },
    );
  }
}
