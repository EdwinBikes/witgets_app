import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/appbar/custom_appbar.dart';

class ConversionScreen extends StatefulWidget {
  static const name = 'leter_num_screen';
  const ConversionScreen({super.key});

  @override
  ConversionScreenState createState() => ConversionScreenState();
}

class ConversionScreenState extends State<ConversionScreen> {
  TextEditingController inputControllerLet = TextEditingController();
  TextEditingController inputControllerNum = TextEditingController();
  String resultadoLet = "";
  String resultadoNum = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbar(titleAppbar: ("Letras ➡️ números")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: inputControllerLet,
                decoration: const InputDecoration(
                  labelText: "Cambiar letras a números",
                ),
                onSubmitted: (String value) {
                  // Esta función se ejecutará cuando el usuario presione "Enter" en el teclado.
                  // Aquí puedes realizar la conversión de letras a números.
                  String texto = value.toUpperCase();
                  String convertido = textoANumeros(texto);
                  setState(() {
                    resultadoLet = convertido;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String texto = inputControllerLet.text.toUpperCase();
                      String convertido = textoANumeros(texto);
                      setState(() {
                        resultadoLet = convertido;
                      });
                    },
                    child: const Text("Convertir a Números"),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      String texto = inputControllerLet.text.toUpperCase();
                      String convertido = textoANumeros(texto);
                      setState(() {
                        resultadoLet = convertido;
                      });
                      FlutterClipboard.copy(convertido);
                    },
                    child: const Text("Copiar texto"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text("Resultado: $resultadoLet"),

              // Cambiar números a letras
              const SizedBox(height: 30),
              TextField(
                controller: inputControllerNum,
                decoration: const InputDecoration(
                  labelText: "Cambiar números a letras",
                ),
                onSubmitted: (String value) {
                  // Esta función se ejecutará cuando el usuario presione "Enter" en el teclado.
                  // Aquí puedes realizar la conversión de números a letras.
                  String numbers = value.toUpperCase();
                  String convertido = numerosALetras(numbers);
                  setState(() {
                    resultadoNum = convertido;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String numbers = inputControllerNum.text.toUpperCase();
                      String convertido = numerosALetras(numbers);
                      setState(() {
                        resultadoNum = convertido;
                      });
                    },
                    child: const Text("Convertir a Letras"),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      String numbers = inputControllerNum.text.toUpperCase();
                      String convertido = numerosALetras(numbers);
                      setState(() {
                        resultadoNum = convertido;
                      });
                      FlutterClipboard.copy(convertido);
                    },
                    child: const Text("Copiar texto"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text("Resultado: $resultadoNum"),
            ],
          ),
        ),
      ),
    );
  }

  String textoANumeros(String texto) {
    String resultLet = "";
    for (int i = 0; i < texto.length; i++) {
      if (texto[i] == " ") {
        resultLet += " "; // Mantén los espacios sin cambios
      } else {
        int valor = texto.codeUnitAt(i) - 64; // Convierte letras a números
        resultLet += "$valor-";
      }
    }
    return resultLet.trim(); // Elimina espacios adicionales al final
  }

  String numerosALetras(String numbers) {
    String resultNum = "";
    List<String> parts = numbers.split("-");

    for (String part in parts) {
      int valor = int.tryParse(part) ?? 0;
      if (valor >= 1 && valor <= 26) {
        String letra = String.fromCharCode(valor + 64);
        resultNum += letra;
      } else {
        // Si el número está fuera del rango (1-26), simplemente mantenlo sin cambios.
        resultNum += part;
      }
    }

    return resultNum;
  }
}
