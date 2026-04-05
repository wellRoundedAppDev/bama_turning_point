import 'dart:convert';
import 'dart:math';

import 'package:classic_eccomerce/authentication/presentation/auth_cubit/auth_cubit.dart';
import 'package:classic_eccomerce/face_recogonition/data/models/face_model.dart';
import 'package:classic_eccomerce/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef FaceMatch = ({FaceRegisteredUser user, double difference, Rect boundingRect, bool isRecognized});

mixin FaceRegistry {
  static FaceRegisteredUser? _registeredUser;
  static const String _storageKey = 'registered_face';

  // Get the registered user (only one)
  static FaceRegisteredUser? get registeredUser => _registeredUser;

  // Load registered face from shared_preferences
  static Future<void> loadRegisteredFace() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(_storageKey);
      print(userJson);
      if (userJson != null) {
        final userMap = json.decode(userJson) as Map<String, dynamic>;
        _registeredUser = FaceRegisteredUser.fromJson(userMap);
        debugPrint("Loaded registered face: ${_registeredUser?.id}");
      }
    } catch (e) {
      debugPrint("Error loading registered face: $e");
      _registeredUser = null;
    }
  }

  // Save registered face to shared_preferences (replaces any existing one)
  static Future<void> saveRegisteredFace(FaceRegisteredUser user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = json.encode(user.toJson());

      print(userJson);
      await prefs.setString(_storageKey, userJson);
      _registeredUser = user;
      Navigator.pop(MyApp.navKey.currentState!.context);
      debugPrint("Saved registered face: ${user.id}");
    } catch (e) {
      debugPrint("Error saving registered face: $e");
    }
  }

  // Clear registered face
  static Future<void> clearRegisteredFace() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
      _registeredUser = null;
      debugPrint("Cleared registered face");
    } catch (e) {
      debugPrint("Error clearing registered face: $e");
    }
  }

  static FaceMatch? findFromList(List<double> vectors, Rect boundingRect) {
    double cutoffThreshold = 0.8;
    FaceMatch? userMatch;

    if (_registeredUser != null) {
      final List<double> knownVector = _registeredUser!.vectorList;
      double distance = 0;

      for (int i = 0; i < vectors.length; i++) {
        double diff = vectors[i] - knownVector[i];
        distance += pow(diff, 2);
      }
      distance = sqrt(distance);
      debugPrint("${_registeredUser!.name}  $distance");
      userMatch = (user: _registeredUser!.copyWith(list: vectors), difference: distance, boundingRect: boundingRect, isRecognized: true);
    }

    if (_registeredUser == null || (userMatch?.difference ?? 1) > cutoffThreshold) {
      return (user: FaceRegisteredUser("Unknown", vectors,0), difference: 1, boundingRect: boundingRect, isRecognized: false);
    }
    return userMatch;
  }
}
