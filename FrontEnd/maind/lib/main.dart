import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BADA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Login Page'),
      routes: {
        '/home': (context) => const HomePage(title: 'Home Page'),
        '/signup': (context) => SignUpPage(title: 'Sign Up'),
        '/account': (context) => const AccountPage(title: 'Account Page'),
        '/settings': (context) => const SettingsPage(title: 'Settings Page'),
        '/schedule': (context) => const SchedulePage(title: 'Schedule Page'),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginPressed() {
    Navigator.pushNamed(context, '/home');
  }

  void _signupPressed() {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _loginPressed,
              child: const Text('Login'),
            ),
            const SizedBox(height: 8.0),
            TextButton(
              onPressed: _signupPressed,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUpPressed() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    // Save the username and password to a database or file.
    // Here, we are just printing them for demonstration purposes.
    print('Username: $username');
    print('Password: $password');
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signUpPressed,
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            },
            icon: const Icon(Icons.account_circle),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/schedule');
            },
            icon: const Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Text(
                'Meals and their dates will appear here.',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/schedule');
            },
            icon: const Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Account Page!',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _toggle1 = false;
  bool _toggle2 = false;
  bool _toggle3 = false;
  bool _toggle4 = false;
  bool _toggle5 = false;
  bool _toggle6 = false;
  bool _toggle7 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/schedule');
            },
            icon: const Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dietary Requirements',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SwitchListTile(
              title: const Text('Vegetarian'),
              value: _toggle1,
              onChanged: (value) {
                setState(() {
                  _toggle1 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Vegen'),
              value: _toggle2,
              onChanged: (value) {
                setState(() {
                  _toggle2 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Kosher'),
              value: _toggle3,
              onChanged: (value) {
                setState(() {
                  _toggle3 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Lactose Intolerance'),
              value: _toggle4,
              onChanged: (value) {
                setState(() {
                  _toggle4 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Gluten-Free'),
              value: _toggle5,
              onChanged: (value) {
                setState(() {
                  _toggle5 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _meals = {};

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _addMeal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _mealController = TextEditingController();
        TextEditingController _priceController = TextEditingController();
        TextEditingController _caloriesController = TextEditingController();
        String _selectedMealType = 'Breakfast';

        return AlertDialog(
          title: const Text('Add Meal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButton<String>(
                value: _selectedMealType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedMealType = newValue!;
                  });
                },
                items: <String>['Breakfast', 'Lunch', 'Dinner']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextField(
                controller: _mealController,
                decoration: const InputDecoration(
                  labelText: 'Meal Name',
                ),
              ),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Price (£)',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _caloriesController,
                decoration: const InputDecoration(
                  labelText: 'Calories',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('CANCEL'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_mealController.text.isNotEmpty &&
                    _priceController.text.isNotEmpty &&
                    _caloriesController.text.isNotEmpty) {
                  setState(() {
                    final meal = '${_mealController.text} - '
                        '$_selectedMealType £${_priceController.text} - '
                        '${_caloriesController.text} kcal';
                    _meals.update(
                      _selectedDay!,
                      (meals) => meals..add(meal),
                      ifAbsent: () => [meal],
                    );
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('ADD'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            },
            icon: const Icon(Icons.account_circle),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            eventLoader: (day) {
              return _meals[day] ?? [];
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Selected Day: ${_selectedDay?.toIso8601String() ?? 'None'}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _meals[_selectedDay]?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_meals[_selectedDay]![index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _selectedDay != null ? () => _addMeal(context) : null,
        tooltip: 'Add Meal',
        child: const Icon(Icons.add),
      ),
    );
  }
}
