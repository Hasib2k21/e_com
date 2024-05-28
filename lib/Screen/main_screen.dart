import 'package:e_com/Screen/Pages/home_page.dart';
import 'package:e_com/Services/services.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex=0;
  List <dynamic> _products=[];
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  fetchProducts()async{
    EcommerceServices services=EcommerceServices();
    _products=await services.fetchProducts();
    print(_products.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(icon:Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label: 'Cart'),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: 'User List'),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex=index;
          });
        },
      ),
      body: PageView(
        children: [
          HomePage(),
          Text('Page2'),
          Text('Page3'),
        ],
      ),
    );
  }
}
