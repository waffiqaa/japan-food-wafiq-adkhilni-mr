import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const JapanFoodApp());
}

class JapanFoodApp extends StatelessWidget {
  const JapanFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Japan Food Wafiq Adkhilni MR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.gold,
          surface: AppColors.card,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class AppColors {
  static const Color primary = Color(0xFFC62828);
  static const Color sakura = Color(0xFFFFCDD2);
  static const Color sakuraSoft = Color(0xFFFFF1F2);
  static const Color background = Color(0xFFFFFBFA);
  static const Color card = Color(0xFFFFF3E6);
  static const Color text = Color(0xFF1E1E1E);
  static const Color muted = Color(0xFF777777);
  static const Color gold = Color(0xFFD4AF37);
  static const Color dark = Color(0xFF121212);
}

String rupiah(int value) {
  final text = value.toString();
  final buffer = StringBuffer();

  for (int i = 0; i < text.length; i++) {
    final reverseIndex = text.length - i;
    buffer.write(text[i]);

    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write('.');
    }
  }

  return 'Rp$buffer';
}

class MenuItem {
  final String name;
  final String category;
  final String image;
  final int price;
  final String description;
  final String icon;

  const MenuItem({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.description,
    required this.icon,
  });
}

class CartItem {
  final MenuItem item;
  int quantity;

  CartItem({
    required this.item,
    required this.quantity,
  });
}

const List<MenuItem> menuItems = [
  MenuItem(
    name: 'Ramen Wafiq',
    category: 'Makanan',
    image: 'assets/images/ramen_wafiq.png',
    price: 28000,
    icon: '🍜',
    description:
        'Ramen hangat dengan kuah gurih, mie lembut, telur, sayuran, dan topping khas Jepang.',
  ),
  MenuItem(
    name: 'Sushi Roll MR',
    category: 'Makanan',
    image: 'assets/images/sushi_roll.png',
    price: 32000,
    icon: '🍣',
    description:
        'Sushi roll premium dengan isian segar, nasi lembut, dan rasa ringan yang cocok untuk semua kalangan.',
  ),
  MenuItem(
    name: 'Chicken Teriyaki',
    category: 'Makanan',
    image: 'assets/images/chicken_teriyaki.png',
    price: 30000,
    icon: '🍱',
    description:
        'Ayam panggang saus teriyaki manis gurih, disajikan dengan nasi hangat dan sayuran.',
  ),
  MenuItem(
    name: 'Katsu Curry',
    category: 'Makanan',
    image: 'assets/images/katsu_curry.png',
    price: 35000,
    icon: '🍛',
    description:
        'Ayam katsu renyah dengan saus kari Jepang yang creamy, hangat, dan mengenyangkan.',
  ),
  MenuItem(
    name: 'Beef Yakiniku',
    category: 'Makanan',
    image: 'assets/images/beef_yakiniku.png',
    price: 38000,
    icon: '🥩',
    description:
        'Irisan daging sapi berbumbu yakiniku dengan rasa gurih manis khas Jepang.',
  ),
  MenuItem(
    name: 'Onigiri Tuna',
    category: 'Makanan',
    image: 'assets/images/onigiri_tuna.png',
    price: 18000,
    icon: '🍙',
    description:
        'Nasi kepal Jepang berisi tuna gurih, praktis, ringan, dan cocok untuk camilan berat.',
  ),
  MenuItem(
    name: 'Takoyaki',
    category: 'Snack',
    image: 'assets/images/takoyaki.png',
    price: 22000,
    icon: '🐙',
    description:
        'Bola-bola takoyaki lembut dengan saus khas Jepang, mayones, dan taburan bonito.',
  ),
  MenuItem(
    name: 'Gyoza',
    category: 'Snack',
    image: 'assets/images/gyoza.png',
    price: 24000,
    icon: '🥟',
    description:
        'Pangsit Jepang isi ayam dan sayuran, dipanggang ringan hingga bagian bawahnya renyah.',
  ),
  MenuItem(
    name: 'Tempura Crispy',
    category: 'Snack',
    image: 'assets/images/tempura_crispy.png',
    price: 26000,
    icon: '🍤',
    description:
        'Tempura renyah dengan balutan tepung ringan, cocok sebagai snack atau pelengkap makan.',
  ),
  MenuItem(
    name: 'Dorayaki',
    category: 'Snack',
    image: 'assets/images/dorayaki.png',
    price: 16000,
    icon: '🥞',
    description:
        'Pancake Jepang lembut dengan isian manis, cocok untuk penutup makanan.',
  ),
  MenuItem(
    name: 'Matcha Latte',
    category: 'Minuman',
    image: 'assets/images/matcha_latte.png',
    price: 20000,
    icon: '🍵',
    description:
        'Minuman matcha creamy dengan rasa teh hijau Jepang yang lembut dan menyegarkan.',
  ),
  MenuItem(
    name: 'Ocha Dingin',
    category: 'Minuman',
    image: 'assets/images/ocha_dingin.png',
    price: 10000,
    icon: '🧊',
    description:
        'Teh hijau Jepang dingin, ringan, segar, dan cocok diminum setelah makan.',
  ),
  MenuItem(
    name: 'Lemon Tea Sakura',
    category: 'Minuman',
    image: 'assets/images/lemon_tea_sakura.png',
    price: 17000,
    icon: '🌸',
    description:
        'Lemon tea segar dengan sentuhan aroma sakura yang lembut dan modern.',
  ),
  MenuItem(
    name: 'Kopi Susu Jepang',
    category: 'Minuman',
    image: 'assets/images/kopi_susu_jepang.png',
    price: 19000,
    icon: '☕',
    description:
        'Kopi susu creamy bergaya Jepang dengan rasa lembut, tidak terlalu pahit.',
  ),
];

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const MainPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: -80,
            right: -60,
            child: CircleAvatar(
              radius: 150,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -80,
            child: CircleAvatar(
              radius: 170,
              backgroundColor: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 118,
                  height: 118,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.18),
                        blurRadius: 30,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text(
                            '🍜',
                            style: TextStyle(fontSize: 52),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Japan Food',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Wafiq Adkhilni MR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.25),
                    ),
                  ),
                  child: const Text(
                    'Japanese Taste • Modern Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 26,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '© Japan Food Wafiq Adkhilni MR',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<CartItem> cart = [];
  int selectedIndex = 0;
  String selectedCategory = 'Semua';

  int get totalItem {
    int total = 0;
    for (final cartItem in cart) {
      total += cartItem.quantity;
    }
    return total;
  }

  int get totalPrice {
    int total = 0;
    for (final cartItem in cart) {
      total += cartItem.item.price * cartItem.quantity;
    }
    return total;
  }

  List<MenuItem> get filteredMenus {
    if (selectedCategory == 'Semua') return menuItems;

    return menuItems
        .where((item) => item.category == selectedCategory)
        .toList();
  }

  void addToCart(MenuItem item) {
    setState(() {
      final index = cart.indexWhere((cartItem) => cartItem.item.name == item.name);

      if (index >= 0) {
        cart[index].quantity++;
      } else {
        cart.add(CartItem(item: item, quantity: 1));
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.name} ditambahkan ke keranjang'),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 900),
      ),
    );
  }

  void increaseQuantity(MenuItem item) {
    setState(() {
      final index = cart.indexWhere((cartItem) => cartItem.item.name == item.name);
      if (index >= 0) cart[index].quantity++;
    });
  }

  void decreaseQuantity(MenuItem item) {
    setState(() {
      final index = cart.indexWhere((cartItem) => cartItem.item.name == item.name);

      if (index >= 0) {
        if (cart[index].quantity > 1) {
          cart[index].quantity--;
        } else {
          cart.removeAt(index);
        }
      }
    });
  }

  void clearCart() {
    setState(() {
      cart.clear();
    });
  }

  void openDetail(MenuItem item) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      builder: (context) {
        return DetailSheet(
          item: item,
          onAdd: () {
            Navigator.pop(context);
            addToCart(item);
          },
        );
      },
    );
  }

  void openPayment() {
    if (cart.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Keranjang masih kosong'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PaymentPage(
          totalPrice: totalPrice,
          totalItem: totalItem,
          onSuccess: () {
            clearCart();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width >= 850;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (isWide)
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: HomeContent(
                      selectedCategory: selectedCategory,
                      onCategoryChanged: (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      },
                      menus: filteredMenus,
                      onAddToCart: addToCart,
                      onOpenDetail: openDetail,
                      totalItem: totalItem,
                    ),
                  ),
                  Container(
                    width: 390,
                    margin: const EdgeInsets.all(18),
                    child: CartPanel(
                      cart: cart,
                      totalPrice: totalPrice,
                      onIncrease: increaseQuantity,
                      onDecrease: decreaseQuantity,
                      onPayment: openPayment,
                    ),
                  ),
                ],
              )
            else
              IndexedStack(
                index: selectedIndex,
                children: [
                  HomeContent(
                    selectedCategory: selectedCategory,
                    onCategoryChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    menus: filteredMenus,
                    onAddToCart: addToCart,
                    onOpenDetail: openDetail,
                    totalItem: totalItem,
                  ),
                  CartPanel(
                    cart: cart,
                    totalPrice: totalPrice,
                    onIncrease: increaseQuantity,
                    onDecrease: decreaseQuantity,
                    onPayment: openPayment,
                    isFullPage: true,
                  ),
                  const AboutPage(),
                ],
              ),
            const Positioned(
              bottom: 8,
              right: 16,
              child: Watermark(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isWide
          ? null
          : NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              indicatorColor: AppColors.sakura,
              destinations: [
                const NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                NavigationDestination(
                  icon: Badge(
                    isLabelVisible: totalItem > 0,
                    label: Text('$totalItem'),
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                  selectedIcon: Badge(
                    isLabelVisible: totalItem > 0,
                    label: Text('$totalItem'),
                    child: const Icon(Icons.shopping_bag),
                  ),
                  label: 'Keranjang',
                ),
                const NavigationDestination(
                  icon: Icon(Icons.info_outline),
                  selectedIcon: Icon(Icons.info),
                  label: 'Tentang',
                ),
              ],
            ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final List<MenuItem> menus;
  final void Function(MenuItem item) onAddToCart;
  final void Function(MenuItem item) onOpenDetail;
  final int totalItem;

  const HomeContent({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.menus,
    required this.onAddToCart,
    required this.onOpenDetail,
    required this.totalItem,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderSection(),
                const SizedBox(height: 18),
                PromoCard(totalItem: totalItem),
                const SizedBox(height: 18),

                CategorySelector(
                  selectedCategory: selectedCategory,
                  onChanged: onCategoryChanged,
                ),

                const SizedBox(height: 12),

                const Text(
                  'Menu Pilihan',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Pilih makanan, snack, atau minuman khas Jepang favorit anda.',
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = menus[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(
                  18,
                  0,
                  18,
                  14,
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.sakura,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            item.image,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  item.icon,
                                  style: const TextStyle(
                                    fontSize: 35,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              item.description,
                              maxLines: 2,
                              overflow:
                                  TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.muted,
                                fontSize: 12,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              rupiah(item.price),
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w900,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),

                      FilledButton(
                        onPressed: () => onAddToCart(item),
                        style: FilledButton.styleFrom(
                          backgroundColor:
                              AppColors.primary,
                        ),
                        child: const Text('ADD'),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: menus.length,
          ),
        ),
      ],
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 58,
          width: 58,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.sakura,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.12),
                blurRadius: 18,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    '🍜',
                    style: TextStyle(fontSize: 27),
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Japan Food',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Wafiq Adkhilni MR',
                style: TextStyle(
                  color: AppColors.muted,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: AppColors.sakuraSoft,
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.star_rounded,
                color: AppColors.gold,
                size: 18,
              ),
              SizedBox(width: 4),
              Text(
                'Premium',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PromoCard extends StatelessWidget {
  final int totalItem;

  const PromoCard({
    super.key,
    required this.totalItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.primary,
            Color(0xFFE53935),
            Color(0xFFFF8A80),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.24),
            blurRadius: 24,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            bottom: -18,
            child: Text(
              '🌸',
              style: TextStyle(
                fontSize: 92,
                color: Colors.white.withValues(alpha: 0.7),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Japanese Food Made Simple',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Pilih menu khas Jepang, masukkan ke keranjang, lalu bayar dengan mudah.',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.4,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.28),
                  ),
                ),
                child: Text(
                  totalItem > 0
                      ? '$totalItem item sudah ada di keranjang'
                      : 'Mulai pesan menu favorit anda',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategorySelector extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onChanged;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final categories = ['Semua', 'Makanan', 'Snack', 'Minuman'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isSelected = selectedCategory == category;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              selected: isSelected,
              label: Text(category),
              selectedColor: AppColors.primary,
              backgroundColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.text,
                fontWeight: FontWeight.w800,
              ),
              side: BorderSide(
                color: isSelected ? AppColors.primary : AppColors.sakura,
              ),
              onSelected: (_) => onChanged(category),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;
  final VoidCallback onDetail;

  const MenuCard({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onDetail,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onDetail,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: AppColors.sakura.withValues(alpha: 0.7),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.045),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: item.name,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      item.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            item.icon,
                            style: const TextStyle(fontSize: 54),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.sakuraSoft,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    item.category,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              item.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.muted,
                fontSize: 12,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    rupiah(item.price),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                  width: 38,
                  child: FilledButton(
                    onPressed: onAdd,
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailSheet extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onAdd;

  const DetailSheet({
    super.key,
    required this.item,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        18,
        0,
        18,
        MediaQuery.of(context).viewInsets.bottom + 22,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Hero(
            tag: item.name,
            child: Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(28),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        item.icon,
                        style: const TextStyle(fontSize: 82),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                rupiah(item.price),
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
              ),
              decoration: BoxDecoration(
                color: AppColors.sakuraSoft,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                item.category,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            item.description,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text(
                'Tambah ke Keranjang',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartPanel extends StatelessWidget {
  final List<CartItem> cart;
  final int totalPrice;
  final void Function(MenuItem item) onIncrease;
  final void Function(MenuItem item) onDecrease;
  final VoidCallback onPayment;
  final bool isFullPage;

  const CartPanel({
    super.key,
    required this.cart,
    required this.totalPrice,
    required this.onIncrease,
    required this.onDecrease,
    required this.onPayment,
    this.isFullPage = false,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 12),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Keranjang',
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 11,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.sakuraSoft,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  '${cart.length} menu',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: cart.isEmpty
              ? const EmptyCart()
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(18, 6, 18, 18),
                  itemBuilder: (context, index) {
                    final cartItem = cart[index];

                    return CartTile(
                      cartItem: cartItem,
                      onIncrease: () => onIncrease(cartItem.item),
                      onDecrease: () => onDecrease(cartItem.item),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemCount: cart.length,
                ),
        ),
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(isFullPage ? 28 : 24),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 20,
                offset: const Offset(0, -8),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Total Pembayaran',
                      style: TextStyle(
                        color: AppColors.muted,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    rupiah(totalPrice),
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton.icon(
                  onPressed: onPayment,
                  icon: const Icon(Icons.payment),
                  label: const Text(
                    'Lanjut Pembayaran',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (isFullPage) {
      return Container(
        color: AppColors.background,
        child: content,
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: AppColors.sakura,
        ),
      ),
      child: content,
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 92,
              width: 92,
              decoration: const BoxDecoration(
                color: AppColors.sakuraSoft,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 46,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Keranjang masih kosong',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Silakan pilih menu Jepang favorit anda terlebih dahulu.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.muted,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartTile extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const CartTile({
    super.key,
    required this.cartItem,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    final item = cartItem.item;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.sakura.withValues(alpha: 0.7),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(18),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                item.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Text(
                      item.icon,
                      style: const TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.text,
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  rupiah(item.price),
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              QuantityButton(
                icon: Icons.remove,
                onTap: onDecrease,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  '${cartItem.quantity}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
              ),
              QuantityButton(
                icon: Icons.add,
                onTap: onIncrease,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: IconButton.filledTonal(
        onPressed: onTap,
        icon: Icon(icon, size: 16),
        style: IconButton.styleFrom(
          backgroundColor: AppColors.sakuraSoft,
          foregroundColor: AppColors.primary,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

class PaymentPage extends StatefulWidget {
  final int totalPrice;
  final int totalItem;
  final VoidCallback onSuccess;

  const PaymentPage({
    super.key,
    required this.totalPrice,
    required this.totalItem,
    required this.onSuccess,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String selectedMethod = 'Bayar di Kasir';

  void processPayment() {
    final queueNumber = 'JP-${Random().nextInt(73) + 27}';

    widget.onSuccess();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => SuccessPage(
          queueNumber: queueNumber,
          paymentMethod: selectedMethod,
          totalPrice: widget.totalPrice,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final methods = [
      {
        'title': 'Bayar di Kasir',
        'subtitle': 'Bayar langsung kepada kasir setelah pesanan dikonfirmasi.',
        'icon': Icons.storefront,
      },
      {
        'title': 'Transfer',
        'subtitle': 'Transfer ke rekening atau e-wallet yang tersedia di kasir.',
        'icon': Icons.account_balance_wallet,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pembayaran',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ringkasan Pesanan',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SummaryRow(
                    label: 'Jumlah Item',
                    value: '${widget.totalItem} item',
                  ),
                  const SizedBox(height: 8),
                  SummaryRow(
                    label: 'Total Harga',
                    value: rupiah(widget.totalPrice),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Pilih Metode Pembayaran',
              style: TextStyle(
                color: AppColors.text,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            ...methods.map((method) {
              final title = method['title'] as String;
              final subtitle = method['subtitle'] as String;
              final icon = method['icon'] as IconData;
              final isSelected = selectedMethod == title;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    setState(() {
                      selectedMethod = title;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.sakuraSoft : Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.sakura,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              isSelected ? AppColors.primary : AppColors.card,
                          child: Icon(
                            icon,
                            color: isSelected ? Colors.white : AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  color: AppColors.text,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                subtitle,
                                style: const TextStyle(
                                  color: AppColors.muted,
                                  fontSize: 12,
                                  height: 1.35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Radio<String>(
                          value: title,
                          groupValue: selectedMethod,
                          activeColor: AppColors.primary,
                          onChanged: (value) {
                            if (value == null) return;

                            setState(() {
                              selectedMethod = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 18),
            SizedBox(
              height: 56,
              child: FilledButton.icon(
                onPressed: processPayment,
                icon: const Icon(Icons.check_circle_outline),
                label: const Text(
                  'Bayar Sekarang',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                  ),
                ),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Center(
              child: Watermark(),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class SuccessPage extends StatelessWidget {
  final String queueNumber;
  final String paymentMethod;
  final int totalPrice;

  const SuccessPage({
    super.key,
    required this.queueNumber,
    required this.paymentMethod,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                Container(
                  height: 118,
                  width: 118,
                  decoration: BoxDecoration(
                    color: AppColors.sakuraSoft,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: AppColors.primary,
                    size: 70,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Pembayaran Berhasil',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.text,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Terima kasih sudah memesan di Japan Food Wafiq Adkhilni MR.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.muted,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppColors.sakura,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 24,
                        offset: const Offset(0, 14),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Nomor Antrean',
                        style: TextStyle(
                          color: AppColors.muted,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        queueNumber,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const Divider(height: 34),
                      SuccessInfoRow(
                        label: 'Metode Pembayaran',
                        value: paymentMethod,
                      ),
                      const SizedBox(height: 10),
                      SuccessInfoRow(
                        label: 'Total',
                        value: rupiah(totalPrice),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Text(
                    'Pesanan anda sedang dibuat. Tunggu pelayan mengantar makanan anda di meja anda 😊.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 26),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainPage(),
                        ),
                        (route) => false,
                      );
                    },
                    icon: const Icon(Icons.home_outlined),
                    label: const Text(
                      'Kembali ke Beranda',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                const Watermark(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SuccessInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const SuccessInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.muted,
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w900,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const HeaderSection(),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.sakura,
            ),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  color: AppColors.text,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Japan Food Wafiq Adkhilni MR adalah aplikasi pemesanan makanan dan minuman khas Jepang yang dibuat sederhana, modern, bersih, dan nyaman digunakan oleh semua kalangan.',
                style: TextStyle(
                  color: AppColors.muted,
                  height: 1.55,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 18),
              FeatureText(text: 'Tanpa login dan tanpa pembuatan akun'),
              FeatureText(text: 'Memiliki daftar menu makanan, snack, dan minuman'),
              FeatureText(text: 'Memiliki detail menu dan keranjang pesanan'),
              FeatureText(text: 'Pembayaran bisa melalui kasir atau transfer'),
              FeatureText(text: 'Nomor antrean otomatis setelah pembayaran berhasil'),
              FeatureText(text: 'Desain responsive untuk layar HP dan layar besar'),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Center(
          child: Watermark(),
        ),
      ],
    );
  }
}

class FeatureText extends StatelessWidget {
  final String text;

  const FeatureText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.primary,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppColors.text,
                fontSize: 13,
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Watermark extends StatelessWidget {
  const Watermark({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '© Japan Food Wafiq Adkhilni MR',
      style: TextStyle(
        color: AppColors.muted.withValues(alpha: 0.55),
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}