//Dados do morador e menu secundário (Ajuda, Regras)
import 'package:empresta_ai_app/controllers/sessao_controller.dart';
import 'package:empresta_ai_app/theme/tema.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget{
    const PerfilView({super.key, required this.sessao});

    final SessaoController sessao;

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;
    final apartamento = sessao.apartamento ?? '-';
    return ListView(
        padding: const EdgeInsets.all(TemaEmprestaAi.espacoM),
        children: [
            const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
            const SizedBox(height: TemaEmprestaAi.espacoM),
            Text(
                'Apartamento $apartamento',
                textAlign: TextAlign.center,
                style: textos.titleLarge,
            ),
            const SizedBox(height: TemaEmprestaAi.espacoG),
            const ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('Ajuda'),
            ),
            const ListTile(
                leading: Icon(Icons.description_outlined),
                title: Text('Regras de uso do condomínio'),
            ),
        ],
    );
  }  
}
