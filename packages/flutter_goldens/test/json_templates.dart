// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Json response template for the contents of the auth_opt.json file created by
/// goldctl.
String authTemplate({
  bool gsutil = false,
}) {
  return '''
    {
      "Luci":false,
      "ServiceAccount":"${gsutil ? '' : '/packages/flutter/test/widgets/serviceAccount.json'}",
      "GSUtil":$gsutil
    }
  ''';
}

/// Json response template for Skia Gold ignore request:
/// https://flutter-gold.skia.org/json/v1/ignores
String ignoreResponseTemplate({
  String pullRequestNumber = '0000',
  String testName = 'flutter.golden_test.1',
  String otherTestName = 'flutter.golden_test.1',
  String expires = '2019-09-06T21:28:18.815336Z',
  String otherExpires = '2019-09-06T21:28:18.815336Z',
}) {
  return '''
    [
      {
        "id": "7579425228619212078",
        "name": "contributor@getMail.com",
        "updatedBy": "contributor@getMail.com",
        "expires": "$expires",
        "query": "ext=png&name=$testName",
        "note": "https://github.com/flutter/flutter/pull/$pullRequestNumber"
      },
      {
        "id": "7579425228619212078",
        "name": "contributor@getMail.com",
        "updatedBy": "contributor@getMail.com",
        "expires": "$otherExpires",
        "query": "ext=png&name=$otherTestName",
        "note": "https://github.com/flutter/flutter/pull/99999"
      }
    ]
  ''';
}

/// Json response template for Skia Gold image request:
/// https://flutter-gold.skia.org/img/images/[imageHash].png
List<List<int>> imageResponseTemplate() {
  return <List<int>>[
    <int>[137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73,
      72, 68, 82, 0, 0, 0, 1, 0, 0, 0, 1, 8, 6, 0, 0, 0, 31, 21, 196, 137, 0],
    <int>[0, 0, 11, 73, 68, 65, 84, 120, 1, 99, 97, 0, 2, 0,
      0, 25, 0, 5, 144, 240, 54, 245, 0, 0, 0, 0, 73, 69, 78, 68, 174, 66, 96,
      130],
  ];
}
