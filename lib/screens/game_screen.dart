import 'package:flutter/material.dart';
import 'package:multiplayer_tictactoe/utils/colors.dart';
import 'package:multiplayer_tictactoe/widgets/custom_button.dart';
import 'package:multiplayer_tictactoe/widgets/custom_text.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';
import '../resources/socket_methods.dart';
import '../views/scoreboard.dart';
import '../views/tictactoe_board.dart';
import '../views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static String routeName = '/game';
  const GameScreen({super.key});



  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {


    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    // return Scaffold(
    //   body: roomDataProvider.roomData['isJoin']
    //       ? const WaitingLobby()
    //       : SafeArea(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         const CustomText(shadows: [], text: 'Tic-Tac-Toe', fontSize: 18),
    //         const Scoreboard(),
    //         const TicTacToeBoard(),
    //
    //         CustomButton(
    //           onTap: (){},
    //           text: '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
    //         ),
    //         // Container(
    //         //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    //         //   decoration: BoxDecoration(
    //         //     color: btnColor,
    //         //     borderRadius: BorderRadius.circular(10)
    //         //   ),
    //         //   child: Text(
    //         //       '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
    //         //   style: const TextStyle(
    //         //     color: bgColor,
    //         //     fontSize: 18,
    //         //     fontWeight: FontWeight.bold,
    //         //   ),),
    //         // ),
    //
    //       ],
    //     ),
    //   ),
    // );

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          :  SafeArea(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const CustomText(shadows: [], text: 'Tic-Tac-Toe', fontSize: 28),

                const Scoreboard(),
                const TicTacToeBoard(),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: btnColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                      '${roomDataProvider.roomData['turn']['nickname']}\'s turn',
                  style: const TextStyle(
                    color: bgColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                ),



              ],
            ),
          ),
    );











  }
}