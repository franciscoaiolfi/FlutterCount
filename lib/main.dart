import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //Obrigado passar qual a Home do App
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  bool get isEmpty => counter == 0;
  bool get isFull => counter == 20;

//[É NECESSÁRIO PASSAR A MUDANÇA DE ESTADO DA TELA PARA O ELEMENTO]
  void decrement() {
    setState(() {
      counter--;
    });
    print(counter);
  }

//[É NECESSÁRIO PASSAR A MUDANÇA DE ESTADO DA TELA PARA O ELEMENTO]
  void increment() {
    setState(() {
      counter++;
    });
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/img.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode Entrar',
              style: const TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              // Usei para dar espaço entre os elementos
              padding: EdgeInsets.all(32),
              child: Text(
                counter.toString(),
                style: TextStyle(
                  fontSize: 35,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  //Quando passamos null para um botão ele é desabilitado
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text('Sair',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      )),
                ),
                const SizedBox(width: 32),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ), //Passa dimensoes fixas - é responsivo?
                  ),
                  onPressed: isFull ? null : increment,
                  child: const Text('Adcionar',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
