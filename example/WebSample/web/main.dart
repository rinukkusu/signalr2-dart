import 'dart:async';
import 'dart:js';
import 'package:signalr2/signalr2.dart' as signalr;

Future<Null> main() async {
  var connection = new signalr.HubConnection('/test');

  connection.on('send', allowInterop((data) {
    print(data);
  }));

  await connection.start();

  new Timer.periodic(const Duration(seconds: 1), (r) {
    connection.send("send", "Hi");
  });
}
