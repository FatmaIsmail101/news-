import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeingViewModel extends Cubit<ThemeMode> {
  ThemeingViewModel() : super(ThemeMode.light);

  void toggleTheme(String theme) {
    if(state==theme)return;
    if(theme=="Light"){
      emit(ThemeMode.light);
    }
    else{
      emit(ThemeMode.dark);
    }
  }
}
