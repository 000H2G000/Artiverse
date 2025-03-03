import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng latlngConverter(
  List<double>? lat,
  List<double>? lng,
) {
  // Handle null cases immediately
  if (lat == null || lng == null || lat.isEmpty || lng.isEmpty) {
    return const LatLng(51.5085, -0.1257);
  }

  // Find the safe iteration limit
  final maxIndex = math.min(lat.length, lng.length);

  // Return first valid pair (with null safety)
  for (int i = 0; i < maxIndex; i++) {
    final latitude = lat[i];
    final longitude = lng[i];

    if (latitude != null && longitude != null) {
      return LatLng(latitude, longitude);
    }
  }

  // Fallback if all entries are null
  return const LatLng(0.0, 0.0);
}
