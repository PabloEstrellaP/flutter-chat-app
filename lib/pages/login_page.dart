import 'package:chat/helpers/mostrar_alerta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat/services/auth_services.dart';
import 'package:chat/widgets/btn_azul.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Messenger',),
                _Form(),
                Labels(ruta: 'register', subtitulo: 'Registrate', titulo: '¿No tienes una cuenta?',),
                Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
              ],
            ),
          ),
        ),
      )
    );
  }
}


class _Form extends StatefulWidget {
  _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top:40),
      padding: EdgeInsets.symmetric(horizontal: 50),
       child: Column(
         children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            textcontroller: emailCtrl,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textcontroller: passCtrl,
            keyboardType: TextInputType.emailAddress,
            isPasword: true,
          ),
          BotonAzul(
            onPressed: authService.autenticando ? null : () async{
              
              FocusScope.of(context).unfocus();
              final loginOK = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
              
              if(loginOK){
                Navigator.pushReplacementNamed(context, 'usuarios');
              }else{
                mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales nuevamente');
              }

            }, 
            text: 'Ingrese')
         ],
       ),
    );
  }
}
