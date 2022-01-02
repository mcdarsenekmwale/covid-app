import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:stream_chat_persistence/stream_chat_persistence.dart';

class MessagingServices extends GetxService{

  /// Instance of [StreamChatClient] we created earlier. This contains information about
  /// our application and connection state.
  StreamChatClient client;
  Channel channel;

  Future<MessagingServices> init() async {
    try {
      final chatPersistentClient = StreamChatPersistenceClient(
        logLevel: Level.INFO,
        connectionMode: ConnectionMode.background,
      );
      final apiKey = "vymb9s7zqugt";
      final userToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZmxhdC1waW5lLTgifQ.XP6aY9JYiz1oi7KzpACTEX0Z_MNMbaUiMqQWF_j7P5Y";

      /// Create a new instance of [StreamChatClient] passing the apikey obtained from
      /// your project dashboard.
      client = StreamChatClient(
        apiKey,//'s2dxdhpxd94g',
        logLevel: Level.INFO,
      );//..chatPersistenceClient = chatPersistentClient;

      /// Set the current user and connect the websocket.
      /// In a production scenario, this should be done using a backend to generate
      /// a user token using our server SDK.
      /// Please see the following for more information:
      /// https://getstream.io/chat/docs/ios_user_setup_and_tokens/
      ///
      final user = User(id: "super-band-9", extraData: {
        "name": "McDarsene Doe",
        "image": "http://local.getstream.io:9000/random_png/?id=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoiZGVsaWNhdGUtcG9uZC00IiwiZXhwIjoxNjE3NDQzOTgzfQ.RD-NX0VkqTPAlARqfXnaXXln9jrQMdUepxFJ0tghn6g&amp;name=delicate",
      });

      await client.connectUser(
       user,
       userToken,
      );

      channel = client.channel(
        'messaging',
        id: "flutterdevs",
        extraData: {
          "name": "Founder Chat",
          "image": "http://bit.ly/2O35mws",
          "members": ["thierry", "tommaso"],
        },
      );

      await channel.watch();
    }
    catch(error){
      print(error);
    }
    return this;
  }

  createNewChannel() async{
    final channel = client.channel(
      "messaging",
      id: "flutterdevs",
      extraData: {
        "name": "Founder Chat",
        "image": "http://bit.ly/2O35mws",
        "members": ["thierry", "tommaso"],
      },
    );
    final state = await channel.watch();
    print(state.watcherCount);
  }


  @override
  void onInit() async{
    super.onInit();
  }


//ejnb24gx4utfvx4cqnuwab2p35vvk6fdz7tgu6cdsbzd5c9uyqbh35wn4u7zjcq9
}