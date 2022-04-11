import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/fish/cubit/stats.dart';
import 'package:untitled/modules/fish_screan.dart';
import 'package:untitled/modules/freezers.dart';
import 'package:untitled/modules/setting.dart';

class FishCubit extends Cubit<FishStates>{
  FishCubit():super(FishInitialState());
  static FishCubit git(context)=>BlocProvider.of(context);
  int currentIndex =0 ;
  List<BottomNavigationBarItem>bottomItems =[
    BottomNavigationBarItem(
      icon:Icon( Icons.directions_boat),
      label: "Fish",
    ),
    BottomNavigationBarItem(
      icon:Icon( Icons.anchor_outlined),
      label: "Freezers",
    ),
    BottomNavigationBarItem(
      icon:Icon( Icons.settings),
      label: "Settings",
    ),

  ];
  List <Widget>screen =[
    FishScrean(),
    FreezersScrean(),
    CommunicationScrean(),


  ];


  void changeBottomnavBar(int index){
    currentIndex =index ;
    emit(FishBottomNavState());

  }
}