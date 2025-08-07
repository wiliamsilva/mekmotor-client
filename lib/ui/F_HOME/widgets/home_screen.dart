import 'package:mekmotorclient/ui/F_AUTHENTICATION/widgets/authentication_screen.dart';
import 'package:mekmotorclient/utils/mekmotor_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  /**
   * TODO Dados de exemplo para a barra de pesquisa
   */
  final List<String> _data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Papaya',
    'Peach',
    'Plum',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];
  List<String> _filteredData = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      _filteredData = _data
          .where(
            (element) => element.toLowerCase().contains(
              _searchController.text.toLowerCase(),
            ),
          )
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [MekMotorColors.orange, MekMotorColors.orangeTopGradient],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Buscar no MekMotor',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.jpg"),
              ),
              accountName: Text("Avatar"),
              accountEmail: Text("teste@teste.com.br"),
            ),
            ListTile(
              leading: Icon(Icons.menu_book_rounded),
              title: Text("Quer saber como este app foi feito?"),
              dense: true,
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Deslogar"),
              dense: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthenticationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : ListView.builder(
              itemCount: _filteredData.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  _filteredData[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
      backgroundColor: Colors.deepPurple.shade900,
    );
  }
}
