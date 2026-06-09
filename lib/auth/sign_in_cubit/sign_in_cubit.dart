import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.apiConsumer}) : super(SignInInitial());
  final ApiConsumer apiConsumer;

  signIn({required String email, required String password}) async {
    log("email: $email, password: $password");

    try {
      emit(SignInLoading());
      await apiConsumer.post(
        url: 'https://accessories-eshop.runasp.net/api/auth/login',
        data: {"email": email, "password": password},
      );
      emit(SignInSuccess());
    } on DioException catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }
}
