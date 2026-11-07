import 'package:empresta_ai_app/controllers/itens_controller.dart';
import 'package:empresta_ai_app/models/item.dart';
import 'package:flutter/material.dart';

class ItemDetalheView extends StatelessWidget{
  const ItemDetalheView({super.key, required this.item, required this.controller});

  final Item item;
  final ItensController controller;

  Future<void> _pedir(BuildContext context) async {
    final confirmou = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar pedido?'),
        content: Text(
          'Vamos avisar ${item.dono} (${item.apartamento}) que você quer pegar "${item.nome}".',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), 
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true), 
            child: const Text('Confirmar'),
          ),
        ],
      )
    );
    if (confirmou != true || !context.mounted) return;

    final deuCerto = controller.pedir(item);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(deuCerto
            ? 'Pedido enviado! ${item.dono} vai receber o aviso.'
            : 'Esse item acabou de ser emprestado para outra pessoa.'),
      )
    );
    if (deuCerto) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context)

}