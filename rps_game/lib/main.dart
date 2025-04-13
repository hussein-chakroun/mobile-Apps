import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Paper Scissors',
      home: rps_game(),
    );
  }
}

class rps_game extends StatefulWidget {
  const rps_game({super.key});
  @override
  State<rps_game> createState() => _rps_gameState();
}

int playerScore = 0;
int computerScore = 0;
String Result(String playerChoice, String computerChoice) {
  if (playerChoice == computerChoice) {
    print('Draw');
  } else if ((playerChoice == 'rock' && computerChoice == 'sissors') ||
      (playerChoice == 'paper' && computerChoice == 'rock') ||
      (playerChoice == 'sissors' && computerChoice == 'paper')) {
    playerScore++;
    print('Player wins!');
  } else {
    computerScore++;
    print('Computer wins!');
  }

  return (playerChoice == computerChoice)
      ? 'Draw'
      : ((playerChoice == 'rock' && computerChoice == 'sissors') ||
          (playerChoice == 'paper' && computerChoice == 'rock') ||
          (playerChoice == 'sissors' && computerChoice == 'paper'))
      ? 'Player wins!'
      : 'Computer wins!';
}

class _rps_gameState extends State<rps_game> {
  String computerChoice = ['rock', 'paper', 'sissors'][Random().nextInt(3)];
  String playerChoice = 'rock';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Rock Paper Scissors'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Computer Choice: $computerChoice',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Your Choice: $playerChoice',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      playerChoice = 'rock';
                      computerChoice =
                          ['rock', 'paper', 'sissors'][Random().nextInt(3)];
                    });
                  },
                  child: const Text('✊ Rock'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      playerChoice = 'paper';
                      computerChoice =
                          ['rock', 'paper', 'sissors'][Random().nextInt(3)];
                    });
                  },
                  child: const Text('✋ Paper'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      playerChoice = 'sissors';
                      computerChoice =
                          ['rock', 'paper', 'sissors'][Random().nextInt(3)];
                    });
                  },
                  child: const Text('✌️ Scissors'),
                ),
              ],
            ),
            Text('Result: ${Result(playerChoice, computerChoice)}'),
            const SizedBox(height: 20),
            Text('Your score: $playerScore'),
            const SizedBox(height: 20),
            Text('Computer score: $computerScore'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  playerScore = 0;
                  computerScore = 0;
                });
              },
              child: const Text('Reset Score'),
            ),
          ],
        ),
      ),
    );
  }
}
