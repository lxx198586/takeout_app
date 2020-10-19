// Name cannot have comma

class Menu {
  String imageUrl;
  String name;
  double price;
  String key;
  int count;

  Menu({
    this.imageUrl,
    this.name,
    this.price,
    this.key,
    this.count,
  });
}

final List<Menu> menus = [
  Menu(
    imageUrl: 'assets/images/appetizers/chorizo-canapes.jpg',
    name: 'Chorizo Canapes',
    price: 12.99,
    key: 'ap01',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/appetizers/cucumber-bites.jpg',
    name: 'Cucumber Bites',
    price: 8.99,
    key: 'ap02',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/appetizers/delish-deviled-eggs.jpg',
    name: 'Delish Deviled Eggs',
    price: 11.99,
    key: 'ap03',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/appetizers/shrimp-and-chorizo.jpg',
    name: 'Shrimp and Chorizo',
    price: 15.99,
    key: 'ap04',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/appetizers/spinach-dip.jpg',
    name: 'Spinach Dip',
    price: 12.99,
    key: 'ap05',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/soupsalad/creamy-soup-salad.jpg',
    name: 'Creamy Soup Salad',
    price: 12.99,
    key: 'ss01',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/soupsalad/lemon-chicken-soup-salad.jpg',
    name: 'Lemon Chicken Soup Salad',
    price: 8.99,
    key: 'ss02',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/soupsalad/olive-garden-lunch-embedded.jpg',
    name: 'Olive Garden Lunch Embedded',
    price: 11.99,
    key: 'ss03',
    count: 0,
  ),
  Menu(
    imageUrl:
        'assets/images/soupsalad/strawberry-spinach-salad-artichoke-soup.jpg',
    name: 'Strawberry Spinach Salad Artichoke Soup',
    price: 15.99,
    key: 'ss04',
    count: 0,
  ),
  Menu(
    imageUrl: 'assets/images/soupsalad/zuppa-tuscana.jpg',
    name: 'Zuppa Tuscana',
    price: 12.99,
    key: 'ss05',
    count: 0,
  ),
];



