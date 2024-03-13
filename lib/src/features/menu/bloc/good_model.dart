import 'dart:typed_data';

import 'package:flutter_course/src/common/interfaces/interface_ided.dart';
import 'package:flutter_course/src/common/interfaces/interface_imaged.dart';
import 'package:flutter_course/src/common/interfaces/interface_named.dart';
import 'package:flutter_course/src/common/interfaces/interface_prieced.dart';
import 'package:flutter_course/src/common/interfaces/interface_subtyped.dart';

class GoodModel
    implements
        IdedInterface,
        PriecedInterface,
        NamedInterface,
        ImagedInteface,
        SubtypedInteface {
  @override
  late Uint8List image;

  @override
  late String name;

  @override
  late double priece;

  @override
  late String subtype;

  GoodModel({
    required this.id,
    required this.name,
    required this.priece,
    required this.subtype,
    required this.image,
  });

  @override
  String id;
}
