import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/core/networking/handle_error.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.apiConsume}) : super(SignUpInitial());

  final ApiConsumer apiConsume;
  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      emit(SignUpLoading());
      await apiConsume.post(
        url: '/auth/register',
        data: {"email": email, "password": password, "firstName": firstName, "lastName": lastName},
      );
      emit(SignUpSuccess());
    } on DioException catch (e) {
      emit(SignUpFailure(errorMessage: handleError(e)));
    }
  }
}
