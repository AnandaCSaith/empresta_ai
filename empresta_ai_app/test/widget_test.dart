import 'package:empresta_ai_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Entrada recusa formulário vazio', (tester) async {
    await tester.pumpWidget(const EmprestaAiApp());

    final botaoEnviar = find.text('Entrar'); 
    expect(botaoEnviar, findsOneWidget); 

    await tester.ensureVisible(botaoEnviar);
    await tester.tap(botaoEnviar);
    await tester.pumpAndSettle();

    expect(find.text('Informe o bloco e apartamento'), findsOneWidget);
  });

  // CORREÇÃO: Aspas corrigidas na descrição do teste
  testWidgets('Entrar mostra a lista de itens', (tester) async {
    await tester.pumpWidget(const EmprestaAiApp());
    
    // Insere os dados nos campos de texto
    await tester.enterText(find.byType(TextFormField).at(0), 'A-302');
    await tester.enterText(find.byType(TextFormField).at(1), '1234');
    
    // Clica no botão para entrar
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();
    
    expect(find.text('O que você precisa hoje?'), findsOneWidget);
  });

  testWidgets('Tela de entrada segue as diretrizes de acessibilidade', (tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(const EmprestaAiApp());
    
    // Validações de acessibilidade
    await expectLater(tester, meetsGuideline(androidTapTargetGuideline));
    await expectLater(tester, meetsGuideline(labeledTapTargetGuideline));
    await expectLater(tester, meetsGuideline(textContrastGuideline));
    
    handle.dispose();
  });
}
