import 'dart:async';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:uni_links/uni_links.dart';

@Singleton()
class AppLinks {
  StreamSubscription? sub;

  Future checkDeepLink() async {
    try {
      getInitialLink().then((value) {
        print("initial link is $value ");
      });

      uriLinkStream.listen((event) {
        print("current link is $event");
        if (event != null) {
          var data = event.queryParameters;
          print("link payload $data");
        }
      });
    } on PlatformException {
      print("PlatformException");
    }
  }
}
