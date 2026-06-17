import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_nti/profile/profile_cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          Text('Profile View Content'),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return CircularProgressIndicator();
              } else if (state is ProfileSuccess) {
                return Column(
                  children: [
                    Text('User Info: ${state.profileViewDataModel.email}'),
                    Text('User Info: ${state.profileViewDataModel.fullName}'),
                  ],
                );
              } else {
                return Text('No user info available');
              }
            },
          ),
        ],
      ),
    );
  }
}
