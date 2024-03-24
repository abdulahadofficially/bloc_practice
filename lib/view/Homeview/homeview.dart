import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/view/Homeview/bloc/signin_bloc.dart';
import 'package:project/view/Homeview/bloc/signin_events.dart';
import 'package:project/view/Homeview/bloc/signin_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Form Validation using bloc and cubit',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          BlocBuilder<SiginBloc, SigninState>(
            builder: (context, state) {
              if (state is SiginInErrorState) {
                return Text(
                  state.errorMessage.toString(),
                  style: const TextStyle(color: Colors.red),
                );
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              onChanged: (value) {
                BlocProvider.of<SiginBloc>(context).add(
                    SignInTextformFieldonchangedEvent(
                        emailC.text, passwordC.text));
              },
              decoration: const InputDecoration(hintText: 'Email '),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              onChanged: (value) {
                BlocProvider.of<SiginBloc>(context).add(
                    SignInTextformFieldonchangedEvent(
                        emailC.text, passwordC.text));
              },
              decoration: const InputDecoration(hintText: 'Password '),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<SiginBloc, SigninState>(
            builder: (context, state) {
              return CupertinoButton(
                  color:
                      (state is SiginInErrorState) ? Colors.grey : Colors.blue,
                  onPressed: () {},
                  child: const Text('Sign in'));
            },
          )
        ],
      ),
    );
  }
}
