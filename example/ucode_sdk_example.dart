// ignore_for_file: avoid_print

import 'dart:async';

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<Future<void>>(
      () async {

      },
      (error, stackTrace) {
        print('Error: $error, stackTrace: $stackTrace');
      },
    );
