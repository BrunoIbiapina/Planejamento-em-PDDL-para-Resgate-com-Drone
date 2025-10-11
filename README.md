# Sistema de Planejamento de Resgate com Drones

Este projeto implementa um sistema de planejamento automatizado para missões de resgate utilizando drones, baseado em PDDL (Planning Domain Definition Language) e a biblioteca `unified-planning`.

## Descrição do Sistema

O sistema modela um drone que precisa:
- Coletar itens em diferentes localizações
- Entregar os itens em uma zona de entrega
- Retornar à base
- Gerenciar a bateria do drone (4 níveis de energia)

## Arquivos do Projeto

- `domain.pddl` — Domínio STRIPS com bateria discreta (bat4→bat3→bat2→bat1)
- `problem.pddl` — Instância específica (base, z1, z2, z3; itens i1, i2)
- `run_planner.py` — Script principal em Python (Unified Planning + Fast Downward)
- `requirements.txt` — Dependências Python necessárias

## Como executar

```bash
# Criar ambiente virtual
python3 -m venv .venv

# Ativar ambiente virtual
# macOS/Linux:
source .venv/bin/activate
# Windows:
.venv\Scripts\activate

# Instalar dependências
pip install -r requirements.txt

# Executar o planejador
python run_planner.py
```

## 📊 Resultado Esperado

O sistema encontra um plano ótimo com 8 passos:
1. Voar da base para z1
2. Coletar item i1
3. Voar para z2
4. Coletar item i2
5. Voar para z3 (zona de entrega)
6. Entregar i2
7. Entregar i1
8. Retornar à base

## Funcionalidades

- **Sistema de Bateria**: 4 níveis decrescentes a cada voo
- **Coleta e Entrega**: Pickup e delivery de itens
- **Recarga**: Possibilidade de recarregar na base
- **Planejamento Ótimo**: Encontra a sequência mais eficiente

## Tecnologias

- Python 3.13+
- unified-planning
- Fast Downward (planejador)
- PDDL (linguagem de modelagem)
