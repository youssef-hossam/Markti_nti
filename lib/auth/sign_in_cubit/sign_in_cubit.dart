import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.apiConsumer}) : super(SignInInitial());
  final ApiConsumer apiConsumer;

  Future<void> signIn({required String email, required String password}) async {
    log("email: $email, password: $password");

    try {
      emit(SignInLoading());
      await apiConsumer.post(
        url: 'auth/login',
        data: {"email": email, "password": password},
      );
      emit(SignInSuccess());
    } on DioException catch (e) {
      emit(SignInFailure(errorMessage: handleError(e)));
    }
  }
}
