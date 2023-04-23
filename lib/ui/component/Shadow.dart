import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxShadow boxShadow() {
  return BoxShadow(
    color: Colors.black.withOpacity(0.2),
    blurRadius: 5,
    offset: const Offset(0, 2),
  );
}