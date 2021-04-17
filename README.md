# Flutter News app

Flutter news app, that show cases the following: SQflite,HTTP operations, caching responses, user preferences, clean architecture and tests.
## Tech-stack
 * [Flutter](https://flutter.dev) -is a mobile cross-platform,UI toolkit.
 * [Cubit](https://pub.dev/documentation/flutter_cubit/latest/) - The Cubit is a subset of the famous implementation of BLoC Pattern: bloclibrary.dev, it abandons            the concept of Events and simplifies the way of emitting states.
 * [Shared preferences](https://pub.dev/packages/shared_preferences) - for storing key based values.
 * [sqflite](https://pub.dev/packages/sqflite) -sqlite db plugin for android, ios and macos.
 
## Todo
- ~Decide on the state management~ : [flutter_cubit](https://pub.dev/documentation/flutter_cubit/latest/)
- ~Research on a news app design from (dribbble, uplabs .. etc)~
- ~Add HTTP layer~
- ~Add DB layer~
- Finally add test

## Architecture

* ##### File organization
  - cubit: holds all the cubits
  - model: holds the model classes
  - pages: ui residence
  - Repository divided into two the http repo for all http calls and db repo for local database operations
  - Util: for utilities used in the app

  ```
  ├── lib
  │   ├── cubit
  │   ├── main.dart
  │   ├── model
  │   ├── pages
  │   ├── repository
  │   │   ├── database
  │   │   └── http
  │   └── util

  ```

* ##### Dart singleton classes
  Heavily used in the app, singleton pattern is a software design pattern that restricts the instantiation of a class to one "single" instance. 
  example:
  ```
  class HttpClient {
    // Setup a singleton
    static final HttpClient _httpClient = HttpClient._internal();
    factory HttpClient() {
      return _httpClient;
    }
    HttpClient._internal();

    static String baseUrl(String subEndpoint) =>
        "http://newsapi.org/v2/$subEndpoint&apiKey=API KEY";

    Future<http.Response> getRequest(String endpoint) async {
      try {
        http.Response response = await http.Client().get(
          baseUrl(endpoint),
        );
        debugPrint("getRequest:\nurl:$endpoint\nresponse:\n$response");
        return response;
      } catch (e) {
        debugPrint(e);
        throw e;
      }
    }
  }
  ```


## License
```
MIT License

Copyright (c) 2021 Patrick waweru

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Getting Started


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
