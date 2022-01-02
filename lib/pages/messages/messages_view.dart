import 'package:covid_app/services/messaging_services.dart';
import 'package:covid_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'chatLayout.dart';
import 'messages_controller.dart';

class MessagesView extends  GetView<MessagesController>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0.0,
        leading: IconButton(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: Icon(Icons.arrow_back_ios,
            color: Get.theme.scaffoldBackgroundColor,
          ),
          iconSize: 28.0,
          onPressed: (){
            Get.back();
          },
        ),
        actions: [
          IconButton(
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            icon: Icon(Icons.more_vert,
              color: Get.theme.scaffoldBackgroundColor,
            ),
            iconSize: 28.0,
            onPressed: (){
            },
          ),
        ],
        toolbarHeight: kToolbarHeight+ 2.0,
        backgroundColor: Get.theme.primaryColor,
        title: Text('Messages',
          style: TextStyle(
            fontSize: 19.0,
            fontFamily: 'Poppins',

          ),
        ),
        centerTitle: false,
      ),
      body: ChannelsBloc(
        child: ChannelListView(
          filter: {
            'members': {
              '\$in': [StreamChat.of(context).user.id],
            }
          },
          channelPreviewBuilder: _channelPreviewBuilder,
          sort: [SortOption('last_message_at', direction: SortOption.DESC)],
          pagination: PaginationParams(
            limit: 30,
          ),
          channelWidget: ChatLayout(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          //await Get.find<MessagingServices>().createNewChannel();
         // print(StreamChat.of(context).client.queryUsers());
        },
        backgroundColor: AppColor.appColor,
        elevation: 10.0,
        child: Icon(Icons.messenger,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}


  Widget _channelPreviewBuilder(BuildContext context, Channel channel) {
    final lastMessage = channel.state.messages.reversed
        .firstWhere((message) => !message.isDeleted);

    final subtitle = (lastMessage == null ? "nothing yet" : lastMessage.text);
    final opacity = channel.state.unreadCount > .0 ? 1.0 : 0.5;

    return ListTile(
      leading: ChannelImage(
        channel: channel,
      ),
      title: ChannelName(
        textStyle:
        StreamChatTheme.of(context).channelPreviewTheme.title.copyWith(
          color: Colors.black.withOpacity(opacity),
        ),
      ),
      subtitle: Text(subtitle),
      trailing: channel.state.unreadCount > 0
          ? CircleAvatar(
        radius: 10,
        child: Text(channel.state.unreadCount.toString()),
      )
          : SizedBox(),
    );
  }
