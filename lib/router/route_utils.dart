enum AppPage {
  //* Home pages
  home(
    path: '/',
    name: 'Home',
  ),

  //* Transaction Pages
  transaction(
    path: '/transaction',
    name: 'Transactions',
  ),

  //* History Pages
  history(
    path: '/history',
    name: 'History',
  ),

  //* Profile Pages
  profile(
    path: '/profile',
    name: 'Profile',
  ),

  savings(
    path: '/savings',
    name: 'Savings',
  );

  final String path;
  final String name;

  const AppPage({required this.path, required this.name});
}
