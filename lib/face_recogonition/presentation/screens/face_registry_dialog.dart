import 'dart:async';
import 'dart:typed_data';
import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;

import '../../data/models/face_model.dart';
import '../../data/models/face_registry.dart';

class RegisterFaceDialog extends StatelessWidget {
  final BuildContext context;
  final Uint8List imageBytes;
  final FaceRegisteredUser person;
  const RegisterFaceDialog({super.key, required this.imageBytes, required this.person, required this.context});

  Future<void> show() async {


    person.name = MyApp.navKey.currentState?.context.read<AuthCubit>().loginResponse?.loginData?.firstname??"";
    person.id = MyApp.navKey.currentState?.context.read<AuthCubit>().loginResponse?.loginData?.employeeId??0;


    print(person.name);
    print(person.id);

    await FaceRegistry.saveRegisteredFace(person.copyWith());
    // if (context.mounted) {
    //   Navigator.pop(context);
    // }
    return;
    await showDialog(context: context, builder: (ctx) => RegisterFaceDialog(context: context, imageBytes: imageBytes, person: person));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Card(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.memory(imageBytes),
                TextField(
                  onChanged: (text) {
                    person.name = text;
                  },
                  decoration: const InputDecoration(hintText: 'Name', border: OutlineInputBorder()),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await FaceRegistry.saveRegisteredFace(person.copyWith());
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Save this face"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
