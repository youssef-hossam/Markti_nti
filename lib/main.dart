import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marketi_nti/config/cache/cache_helper.dart';
import 'package:marketi_nti/core/app_observer.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/my_app.dart';
import 'package:marketi_nti/profile/profile_cubit/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppObserver();
  await CacheHelper.init();
 
  runApp(MarktiNtiApp());
}
