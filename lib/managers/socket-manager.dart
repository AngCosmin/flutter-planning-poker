import 'package:flutterpoker/config/Config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketManager {
  static Socket socket;

  static void start({Map<String, String> headers}) async {
    SocketManager.socket = io('${Config.backendUrl}?__sails_io_sdk_version=0.11.0', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'extraHeaders': headers,
      'secure': false,
    });

    var prefs = await SharedPreferences.getInstance();

    socket.on('connect', (_) {
      print('connected');
      SocketManager.post('/user/status', { 'isOnline': true, 'token': prefs.getString('token') });

      socket.on('disconnect', (data) {
        print('disconnected');
        SocketManager.post('/user/status', { 'isOnline': false, 'token': prefs.getString('token') });
      });
    });
  }

  static void post(String url, Map<String, dynamic> data) {
    SocketManager.socket.emit('post', { 'url': url, 'data': data });
  }
}

  // socket.on('connect', (_) {
  //   print('connect');
  //   socket.emit('post', {'url': '/user/info', 'data':{'message':"Sending Successfully"}});

  //   socket.on('disconnect', (data) => {
  //     print('disconnect')
  //   });
  // });