import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiplayer_tictactoe/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';
import '../widgets/custom_textfield.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text:
      Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }


  void _copyRoomId() {
    Clipboard.setData(ClipboardData(text: roomIdController.text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Room ID copied to clipboard!"),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          const Column(
            children: [
              CustomText(shadows: [], text: 'Waiting for an opponent', fontSize: 28),
              CustomText(shadows: [], text: '...', fontSize: 28),
            ],
          ),


          const Icon(Icons.timer_sharp, size: 50,),


          Column(
            children: [
              const Text('Send the Room ID to your friend'),
              const SizedBox(height: 10,),
              CustomTextField(
                controller: roomIdController,
                hintText: '',
                isReadOnly: true,
              ),

              IconButton(
                onPressed: _copyRoomId, // Call copy function on tap
                icon: const Icon(Icons.copy),
              ),
            ],
          ),




        ],
      ),
    );
  }
}
