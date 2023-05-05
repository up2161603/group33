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
      title: 'BADA - The Budgeting and Dietary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Login Page'),
      routes: {
        '/home': (context) => const HomePage(title: 'Home Page'),
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
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
      body: Center(
        child: Text(
          'Welcome to the Home Page!',
          style: Theme.of(context).textTheme.headline4,
        ),
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

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key, required this.title}) : super(key: key);
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
              Navigator.pushNamed(context, '/account');
            },
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to the Settings Page!',
          style: Theme.of(context).textTheme.headlineMedium,
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

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
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
            firstDay: DateTime.utc(2010, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Selected Day: ${_selectedDay?.toIso8601String() ?? 'None'}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
