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
  );

  final String path;
  final String name;

  const AppPage({required this.path, required this.name});
}
