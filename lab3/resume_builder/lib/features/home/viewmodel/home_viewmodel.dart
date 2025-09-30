import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/base/base_viewmodel.dart';
import '../model/home_model.dart';

class HomeViewModel extends BaseViewModel {
  HomeModel _homeData = HomeModel(
    userName: 'Valerii Yakushenko',
    position: 'Flutter Developer',
    summary: 'Починаючий Flutter розробник. Спеціалізуюсь на чистому коді та сучасних архітектурах.',
  );

  HomeModel get homeData => _homeData;

  void navigateToProfile(BuildContext context) {
    context.go('/profile');
  }
}