import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/fish/cubit/cupit.dart';

import 'package:untitled/fish/cubit/stats.dart';
import 'cubit/stats.dart';

class FishLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => FishCubit(),
      child: BlocConsumer<FishCubit, FishStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit =FishCubit.git(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 70,
              title: Container(
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,

                      backgroundImage: NetworkImage(
                          "https://drive.google.com/uc?export=download&id=1tX4PbyeuLK1ZoKPOIWcLKZcbm7YA1KGD"),
                    ),
                    Text(
                      '  HE MA ',
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                    Icon(Icons.wifi_calling ,color:Colors.green,size: 40,) ,
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        child: Column(mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment:CrossAxisAlignment.start ,

                          children: [Text(
                            ' 01030654950',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                          ),],
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
            body:cubit.screen[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomnavBar(index);
              },
              items: cubit.bottomItems,
            ),
          );
        },
      ),
    );
  }
}
