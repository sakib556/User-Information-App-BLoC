import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent {}

class LoadUserEvent extends UserEvent {}