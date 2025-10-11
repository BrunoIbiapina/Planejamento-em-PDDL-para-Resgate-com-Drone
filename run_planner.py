#!/usr/bin/env python3
"""
Sistema de Planejamento de Resgate com Drones
Utiliza PDDL e unified-planning para encontrar planos ótimos
"""

import sys
from pathlib import Path
from unified_planning.io import PDDLReader
from unified_planning.shortcuts import OneshotPlanner
import unified_planning as up

def main():
    # Desabilita mensagens de crédito do planejador
    up.shortcuts.get_environment().credits_stream = None
    
    # Caminhos dos arquivos PDDL
    domain_path = "domain.pddl"
    problem_path = "problem.pddl"
    
    # Verifica se os arquivos existem
    if not Path(domain_path).exists():
        print(f" Erro: Arquivo {domain_path} não encontrado!")
        sys.exit(1)
    
    if not Path(problem_path).exists():
        print(f"Erro: Arquivo {problem_path} não encontrado!")
        sys.exit(1)
    
    try:
        # Lê e parseia o problema PDDL
        print("Carregando arquivos PDDL...")
        reader = PDDLReader()
        problem = reader.parse_problem(domain_path, problem_path)
        print(f"Problema carregado: {problem.name}")
        
        # Executa o planejador
        print("🚁 Executando planejador...")
        with OneshotPlanner(problem_kind=problem.kind) as planner:
            print(f"Planejador: {planner.name}")
            result = planner.solve(problem)
        
        # Exibe os resultados
        if result.plan is None:
            print(f"Nenhum plano encontrado. Status: {result.status}")
            sys.exit(1)
        else:
            print(f"Plano encontrado! Passos: {len(result.plan.actions)}")
            print("\nSequência de ações:")
            print("-" * 50)
            
            for i, action in enumerate(result.plan.actions):
                params = ', '.join(str(p) for p in action.actual_parameters)
                print(f"{i+1:2d}: {action.action.name}({params})")
            
            print("-" * 50)
            print(f"Missão concluída em {len(result.plan.actions)} passos!")
            
    except Exception as e:
        print(f"Erro durante a execução: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()