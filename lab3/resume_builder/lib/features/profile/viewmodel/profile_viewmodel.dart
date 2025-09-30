import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/base/base_viewmodel.dart';
import '../model/profile_model.dart';

class ProfileViewModel extends BaseViewModel {
  final ProfileModel _profileData = ProfileModel(
    email: 'valerii.yakushenko@gmail.com',
    phone: '+1 647 534 4691',
    location: 'Toronto, Canada',
    education: [
      Education(
        institution: 'Національний технічний університет «Харківський політехнічний iнститут»',
        degree: '	Комп`ютерні науки. Моделювання, проектування та комп\'ютерна графіка',
        period: '2023-2027',
      )
    ]
  );

  ProfileModel get profileData => _profileData;

  void navigateToHome(BuildContext context) {
    context.go('/');
  }
}