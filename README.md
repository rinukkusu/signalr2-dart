# signalr2

Incredibly simple real-time web for ASP.NET Core 2.1
This is an interop library for the [@aspnet/signalr][signalr_npm] package.
Find more Information at https://github.com/aspnet/SignalR

*Currently in sync with the release `1.0.4` from 2018-10-17.*

## Usage

Add a `<script>` tag to your `index.html` and point it to the current SignalR JavaScript file distributed with the current release of this library:

```html
<script src="packages/signalr2/dist/signalr.min.js"></script>
```

A simple usage example:

```dart
import 'dart:async';
import 'dart:js';
import 'package:signalr2/signalr2.dart' as signalr;

Future<Null> main() async {
  var connection = new signalr.HubConnectionBuilder()
      .withUrl('/chat')
      .configureLogging(signalr.LogLevel.Information)
      .build();

  connection.on('send', allowInterop((data) {
    print(data);
  }));

  await connection.start();

  new Timer.periodic(const Duration(seconds: 1), (r) {
    connection.send('send', 'Hi');
  });
}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/rinukkusu/signalr2-dart
[signalr_npm]: https://www.npmjs.com/package/@aspnet/signalr
