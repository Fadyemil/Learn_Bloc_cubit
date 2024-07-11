import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_of_thrones_api/business_logic_layer/user/user_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UploadProfilePic) {}
      },
      builder: (context, state) {
        if (context.read<UserBloc>().profilePic == null) {
          return DefiletImage();
        } else {
          return InkWell(
            onTap: () {
              ImagePicker()
                  .pickImage(source: ImageSource.gallery)
                  .then((value) {
                context.read<UserBloc>().add(UploadProfilePicEvent(value!));
              });
            },
            child: CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(
                  File(context.read<UserBloc>().profilePic?.path ?? '')),
            ),
          );
        }
      },
    );
  }
}

class DefiletImage extends StatelessWidget {
  const DefiletImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        backgroundImage: const AssetImage("assets/images/avatar.png"),
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () async {},
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    border: Border.all(color: Colors.white, width: 3),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: InkWell(
                    onTap: () {
                      ImagePicker()
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        context.read<UserBloc>().add(UploadProfilePicEvent(value!));
                      });
                    },
                    child: const Icon(
                      Icons.camera_alt_sharp,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
