import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multiplayer_tictactoe/utils/colors.dart';
import 'package:provider/provider.dart';

import '../provider/room_data_provider.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});


  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        // player 1------------------
        Container(
          width: deviceWidth/3.5,
          decoration:
               const BoxDecoration( color: btnColor, shape: BoxShape.circle,
              ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  roomDataProvider.player1.nickname,
                  style: const TextStyle(
                    fontSize: 18,
                    color: bgColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  roomDataProvider.player1.points.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: bgColor,
                  ),
                ),
              ],
            ),
          ),
        ),


        // player2----------------------
        Container(
          width: deviceWidth/3.5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: btnColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  roomDataProvider.player2.nickname,
                  style: const TextStyle(
                    fontSize: 18,
                    color: bgColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  roomDataProvider.player2.points.toInt().toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: bgColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
