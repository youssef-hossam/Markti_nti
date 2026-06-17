import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_nti/config/cache/cache_constants.dart';
import 'package:marketi_nti/config/cache/cache_helper.dart';
import 'package:marketi_nti/core/networking/api_consumer.dart';
import 'package:marketi_nti/profile/models/profile_view_data_model.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.apiConsumer}) : super(ProfileInitial());
  final ApiConsumer apiConsumer;

  Future<ProfileViewDataModel> getCurruntUserInfo() async {
    emit(ProfileLoading());
    String? token = await CacheHelper.getSecureData(key: CacheConstants.accessToken);

    Response response = await apiConsumer.get(token: token!, url: '/auth/me');

    ProfileViewDataModel profileViewDataModel = ProfileViewDataModel.fromJson(response.data);
    emit(ProfileSuccess(profileViewDataModel: profileViewDataModel));

    log(profileViewDataModel.fullName!);
    return profileViewDataModel;
  }
}
