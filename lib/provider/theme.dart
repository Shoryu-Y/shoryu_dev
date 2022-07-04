import 'package:flutter/material.dart';
import 'package:shoryu_dev/colors.dart';

ThemeData get lightTheme => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(seedColor: appBrand),
      useMaterial3: true,
    );

ThemeData get darkTheme => ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: appBrand,
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
    );
