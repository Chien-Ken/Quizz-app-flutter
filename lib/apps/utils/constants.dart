import 'package:flutter/material.dart';

double getWidth(context) => MediaQuery.of(context).size.width;
double getHeight(context) => MediaQuery.of(context).size.height;
double paddingCustom(context) => getWidth(context) * 0.06;
