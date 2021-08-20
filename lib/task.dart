import 'package:flutter/foundation.dart';

class Task{
String id;
String title;
double number;
DateTime date;

Task({
  @required this.id,
  @required this.title,
  @required this.number,
  @required this.date,
});
}