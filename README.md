# signalr2

Incredibly simple real-time web for ASP.NET Core 2.0
This is an interop library for the [@aspnet/signalr_client][signalr_npm] package.
Find more Information at https://github.com/aspnet/SignalR

## Usage

Add a `<script>` tag to your `index.html` and point it to the current SignalR JavaScript file distributed with the current release of this library:

```html
<script src="packages/signalr2/dist/signalr-client-1.0.0-alpha1-final.min.js"></script>
```

A simple usage example:

```dart
import 'dart:async';
import 'package:signalr2/signalr2.dart' as signalr;

Future<Null> main() async {
  var connection = new signalr.HubConnection('/chat');

  connection.on('send', (data) {
    print(data);
  });

  await connection.start();

  connection.invoke('send', 'Hello');
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/rinukkusu/signalr2-dart
[signalr_npm]: https://www.npmjs.com/package/@aspnet/signalr-client