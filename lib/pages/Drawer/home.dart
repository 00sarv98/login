import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login/bloc/name_user/name_user_bloc.dart';

class Home extends StatefulWidget {
  final String? number;
  const Home({super.key, this.number});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("سلام کابربر"),
            SizedBox(height: 10),
            BlocBuilder<NameUserBloc, NameUserState>(
              builder: (context, state) {
                return Text(
                  "${state.text}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
