import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/appbar/custom_appbar.dart';

class TriquiScreen extends StatefulWidget {
  static const name = 'triqui_screen';
  const TriquiScreen({Key? key}) : super(key: key);

  @override
  _TriquiScreenState createState() => _TriquiScreenState();
}

class _TriquiScreenState extends State<TriquiScreen> {
  List<String> cells = List.filled(9, ''); // Represents the 3x3 board
  String currentPlayer = 'X';
  String? winner;

  void checkWin() {
    final winCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];

    for (final combination in winCombinations) {
      final [a, b, c] = combination;
      if (cells[a] != '' && cells[a] == cells[b] && cells[a] == cells[c]) {
        setState(() {
          winner = cells[a];
        });
        _showResultSnackBar(
            winner == 'T' ? "Es un empate!" : 'El Ganador es ➡️ $winner');
        return;
      }
    }

    if (!cells.contains('')) {
      setState(() {
        winner = 'T';
      });
      _showResultSnackBar("Es un empate!");
    }
  }

  void handleCellClick(int index) {
    if (cells[index] == '' && winner == null) {
      setState(() {
        cells[index] = currentPlayer;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
      checkWin();
    }
  }

  void restartGame() {
    setState(() {
      cells = List.filled(9, '');
      currentPlayer = 'X';
      winner = null;
    });
  }

  void _showResultSnackBar(String result) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(result)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: const CustomAppbar(titleAppbar: "Juego triqui"),
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Edwin Bikes',
              style: TextStyle(fontSize: 24, color: colors.primary),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10, // Espacio horizontal entre cuadros
                      mainAxisSpacing: 10, // Espacio vertical entre cuadros
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => handleCellClick(index),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: colors.primary),
                            borderRadius:
                                BorderRadius.circular(10), // Bordes redondeados
                          ),
                          child: Center(
                            child: Text(
                              cells[index],
                              style: const TextStyle(fontSize: 36),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 9,
                  ),
                ),
              ),
            ),
            if (winner != null)
              Positioned(
                bottom: 80,
                child: ElevatedButton(
                  onPressed: restartGame,
                  child: const Text('Restaurar'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
