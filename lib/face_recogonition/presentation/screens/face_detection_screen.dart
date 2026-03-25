import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui' as ui;

import '../../data/models/face_model.dart';
import '../../data/models/face_registry.dart';
import '../../helper/cordinates_translator.dart';
import '../../helper/face_painter.dart';
import '../../helper/face_recognition.dart';
import 'face_registry_dialog.dart';

class FaceDetectionScreen extends StatefulWidget {
  bool isUserRegistering;
   FaceDetectionScreen({super.key,required this.isUserRegistering});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  final imagePicker = ImagePicker();
  final faceRecognition = FaceRecognition();
  img.Image? _viewImage;

  final faceDetector = FaceDetector(options: FaceDetectorOptions(performanceMode: FaceDetectorMode.accurate));
  Size? _imageActualSize;
  int resizeImageWidth = 400;

  Future<List<Face>> detectFaces(File imageFile) async {
    final inputImage = InputImage.fromFile(imageFile);
    final List<Face> faces = await faceDetector.processImage(inputImage);
    return faces;
  }

  List<FaceMatch> recognizedFaces = [];

  bool isProcessing = false;

  void pickAndProcess({ImageSource source = ImageSource.camera}) async {

    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString("registered_face");

    setState(() {
      _viewImage = null;
      _imageActualSize = null;
      isProcessing = true;
    });

    recognizedFaces.clear();

    // 1. Set maxWidth/Height to prevent iOS memory crashes with high-res photos
    final imageFile = await imagePicker.pickImage(
      source: source,
      maxWidth: 1000,
      maxHeight: 1000,
      preferredCameraDevice: CameraDevice.front, // Hint for iOS to start with front cam
    );

    if (imageFile != null) {
      // 2. Load the image using the 'image' package
      var decodedImage = await img.decodeImageFile(imageFile.path);
      if (decodedImage == null) return;

      // 3. FIX FOR iOS FRONT CAMERA:
      // If using the camera, we bake the orientation and flip it
      // so the facial vector matches the "Registry" version.
      if (source == ImageSource.camera) {
        // Bakes the EXIF rotation into the image pixels
        decodedImage = img.bakeOrientation(decodedImage);

        // Manually flip horizontally to fix the mirroring issue
        decodedImage = img.flipHorizontal(decodedImage);
      }

      // 4. Run Face Detection on the original file
      // Note: ML Kit's InputImage.fromFile is usually smart enough for detection,
      // but the 'flip' above ensures the RECOGNITION (vectors) match your database.
      final List<Face> faces = await detectFaces(File(imageFile.path));

      for (final face in faces) {
        // 5. Generate vector using the potentially flipped/fixed image
        final facialVector = await faceRecognition.recognizeFace(decodedImage, face);
        final faceDetail = FaceRegistry.findFromList(facialVector, face.boundingBox);

        if (faceDetail != null) recognizedFaces.add(faceDetail);

        if (userJson != null) {
          final userMap = json.decode(userJson) as Map<String, dynamic>;
          var registeredUser = FaceRegisteredUser.fromJson(userMap);

          if (faceDetail?.user.id == registeredUser.id && faceDetail!.isRecognized) {
            Navigator.pop(context, {"res": true});
            return;
          }
        }
      }

      if (userJson != null && widget.isUserRegistering == false) {
        Navigator.pop(context, {"res": false});
      }

      setState(() {
        _imageActualSize = Size(decodedImage!.width.toDouble(), decodedImage.height.toDouble());
        final resizeHeight = (decodedImage.height / decodedImage.width) * resizeImageWidth;
        _viewImage = img.copyResize(decodedImage, width: resizeImageWidth, height: resizeHeight.toInt());
        isProcessing = false;
      });
    } else {
      setState(() => isProcessing = false);
    }
  }
  // void pickAndProcess({ImageSource source = ImageSource.camera}) async {
  //
  //
  //   final prefs = await SharedPreferences.getInstance();
  //   final userJson = prefs.getString("registered_face");
  //
  //   setState(() {
  //     _viewImage = null;
  //     _imageActualSize = null;
  //     isProcessing = true;
  //   });
  //   recognizedFaces.clear();
  //   final imageFile = await imagePicker.pickImage(source: source);
  //   if (imageFile != null) {
  //     // detect faces
  //     final List<Face> faces = await detectFaces(File(imageFile.path));
  //     final image = await img.decodeImageFile(imageFile.path);
  //     // if (image != null) return;
  //     for (final face in faces) {
  //       // crop image and generate facial vector
  //       final facialVector = await faceRecognition.recognizeFace(image!, face);
  //       final faceDetail = FaceRegistry.findFromList(facialVector, face.boundingBox);
  //       if (faceDetail != null) recognizedFaces.add(faceDetail);
  //
  //
  //
  //       if (userJson != null) {
  //         final userMap = json.decode(userJson) as Map<String, dynamic>;
  //         var registeredUser = FaceRegisteredUser.fromJson(userMap);
  //         if(faceDetail?.user.id == registeredUser.id){
  //
  //           print(faceDetail?.user.id);
  //           print(registeredUser.id);
  //
  //            Navigator.pop(context,{"res":true});
  //           return;
  //
  //         }
  //
  //       }
  //     }
  //
  //     if(userJson != null && widget.isUserRegistering == false){
  //       Navigator.pop(context,{"res":false});
  //
  //     }
  //
  //
  //
  //     setState(() {
  //       _imageActualSize = Size(image!.width.toDouble(), image.height.toDouble());
  //       final resizeHeight = (image.height / image.width) * resizeImageWidth;
  //       _viewImage = img.copyResize(image, width: resizeImageWidth, height: resizeHeight.toInt());
  //       isProcessing = false;
  //     });
  //
  //
  //
  //
  //
  //   }
  // }

  Future<ui.Image?> loadUiImage(img.Image? image) async {
    if (image == null) return null;
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(img.JpegEncoder().encode(image), (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  Future registerFace() async {
    final unknownFace = recognizedFaces.firstWhere((faceData) => !faceData.isRecognized);
    final faceBounding = unknownFace.boundingRect;
    final resizedImageSize = Size(_viewImage!.width.toDouble(), _viewImage!.height.toDouble());
    final left = translateX(faceBounding.left, resizedImageSize, _imageActualSize!).toInt();
    final top = translateY(faceBounding.top, resizedImageSize, _imageActualSize!).toInt();
    final right = translateX(faceBounding.right, resizedImageSize, _imageActualSize!).toInt();
    final bottom = translateY(faceBounding.bottom, resizedImageSize, _imageActualSize!).toInt();
    final croppedImage = img.copyCrop(_viewImage!, x: left, y: top, width: right - left, height: bottom - top);
    await RegisterFaceDialog(context: context, imageBytes: img.JpegEncoder().encode(croppedImage), person: unknownFace.user).show();
  }

  @override
  void initState() {
    super.initState();
    faceRecognition.loadModel();
    // Load registered face from storage
    FaceRegistry.loadRegisteredFace();
  }

  @override
  void dispose() {
    faceRecognition.close();
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(""),
        ),
        body: DefaultTextStyle(
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15, color: Colors.black),
          child: SizedBox.expand(
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                FutureBuilder(
                    future: loadUiImage(_viewImage),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            if (recognizedFaces.isNotEmpty)
                              CustomPaint(
                                  painter: FaceDetectorPainter(recognizedFaces, _imageActualSize!, snapshot.data!),
                                  child: SizedBox.fromSize(size: Size(_viewImage!.width.toDouble(), _viewImage!.height.toDouble()))),
                            const SizedBox(height: 10),
                            Text(recognizedFaces.isEmpty ? "No faces found in picture" : "faces found: ${recognizedFaces.length}"),
                          ],
                        );
                      }
                      return Padding(
                          padding: const EdgeInsets.all(15),
                          child: isProcessing ? const CircularProgressIndicator() : const Text("Please select image"));
                    }),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()),
                    onPressed: () {

                      pickAndProcess();

                      return;
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return Center(
                              child: Material(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                child: SizedBox(
                                  width: 300,
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [


                                      ListTile(title: const Text("Camera"), onTap: pickAndProcess),
                                      // const Divider(height: 0),
                                      // ListTile(title: const Text("Album"), onTap: () => pickAndProcess(source: ImageSource.gallery)),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: const Text("Select image")),
                if (recognizedFaces.isNotEmpty && recognizedFaces.any((faceData) => !faceData.isRecognized)) ...[
                  const SizedBox(height: 30),
                  const Text("Unknown face found... click below to save it"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder()), onPressed: registerFace, child: const Text("SAVE"))
                ]
              ]),
            ),
          ),
        ));
  }
}
