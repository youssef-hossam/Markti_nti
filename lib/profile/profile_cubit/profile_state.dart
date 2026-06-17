part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}



final class ProfileSuccess extends ProfileState {
  final ProfileViewDataModel profileViewDataModel;

  ProfileSuccess({required this.profileViewDataModel});
}
