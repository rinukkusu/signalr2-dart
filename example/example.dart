import 'dart:async';
import '../lib/signalr2.dart' as signalr;

Future<Null> main() async {
  var connection = new signalr.HubConnection('/chat');

  connection.on('send', (data) {
    print(data);
  });

  await connection.start();

  connection.invoke('send', 'Hello');
}
