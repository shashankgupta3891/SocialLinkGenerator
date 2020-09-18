import 'package:flutter/material.dart';

InputDecoration kGreyInputDecoration = InputDecoration(
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide.none,
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide.none,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide.none,
  ),
  filled: true,
  hintStyle: TextStyle(
    color: Colors.grey[700],
  ),
  hintText: "Enter Number",
  fillColor: Colors.grey[150],
);
