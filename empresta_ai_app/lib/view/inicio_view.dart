//Estrutura principal com navegação inferior (tap bar) - Aula 11
import 'package:flutter/material.dart';
import 'package:empresta_ai_app/controllers/itens_controller.dart';
import 'package:empresta_ai_app/controllers/sessao_controller.dart';
import 'package:empresta_ai_app/view/perfil_view.dart';
import 'package:empresta_ai_app/view/itens_view.dart';


class InicioView extends StatefulWidget{
  const InicioView({super.key, required this.sessao, required this.itens});

  final SessaoController sessao;
  final ItensController itens;

  @override
  State<StatefulWidget> createState() => _InicioViewState();
}

  class _InicioViewState extends State<InicioView> {
    int _abaAtual = 0;

  @override
  Widget build(BuildContext context) {
    //As abas 2 ainda provisórias: chegam nas issues #8.
    final abas = [
      ItensView(controller: widget.itens),
      const Center(child: Text('Meus pedidos: chega na issue #8')),
      PerfilView(sessao: widget.sessao),
    ];

    return Scaffold(
      body: SafeArea(child: abas[_abaAtual]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _abaAtual,
        onDestinationSelected: (i) => setState(() => _abaAtual = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search), 
            label: 'Itens',
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined), 
            selectedIcon: Icon(Icons.inventory_2),
            label: 'Meus pedidos',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined), 
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ]
      ),
    );
  }
}

  
