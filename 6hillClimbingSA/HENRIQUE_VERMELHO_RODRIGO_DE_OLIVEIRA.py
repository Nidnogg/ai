'''
Inteligência Artificial - 2020/2
Tarefa: Hillclimbing e SA
Rodrigo Dottori de Oliveira - DRE: 116015658
Henrique Vermelho de Toledo - DRE: 116076549
'''

import random
import copy
import math


# Questão 1
###########

'''
A modelagem do problema representa o tabuleiro como uma lista de N rainhas
O índice da rainha corresponde à sua coluna
O valor corresponde à sua linha
'''


# Questão 2, item a)
####################

'''
Retorna tabuleiro de tamanho N*N
As rainhas estão sempre em colunas diferentes e são identificadas pelo número da sua coluna
A representação é feita guardando a linha de cada rainha
'''
def board(N):
  board = []
  for x in range(0, N):
    column_size = random.randint(0, N-1)
    board.append(column_size)
  return board


# Questão 2, item b)
####################

'''
Retorna uma lista de sublistas
Cada sublista é vizinha do estado atual
'''
def neighbors(board):
  neighbors = []
  editedBoardPositions = copy.deepcopy(board)
  for x in board:
    i = editedBoardPositions.index(x)
    for y in range(0, len(board)):
      currentNeighbor = copy.deepcopy(board)
      if (x == y):
        continue
      currentNeighbor[i] = y
      editedBoardPositions[i] = -1
      neighbors.append(currentNeighbor)
  return neighbors


# Questão 2, item c)
####################

'''
Retorna vizinho aleatório
'''
def randomNeighbor(neighbors):
  return random.choice(neighbors)


# Questão 2, item d)
####################

'''
Retorna número de ataques possíveis entre rainhas
'''
def attacks(board):
  numAttacks = 0

  # Conflitos verticais são impossíveis devido a modelagem
  for i in range(0,len(board)):
    for j in range(i+1,len(board)):
      # Conflitos horizontais: ocorre entre rainhas com valores (linhas) iguais
      if board[i] == board[j]:
        numAttacks += 1
  	  # Conflitos diagonais: ocorre entre pares de rainhas cuja distância vertical e horizontal são iguais
      elif abs(j-i) == abs(board[j]-board[i]):
        numAttacks += 1

  return numAttacks



# Questão 3, item a)
####################

'''
Retorna o nó corrente final do algoritmo de hill climbing e o número de ataques (para saber se é solução ótima)
Essa função considera o primeiro vizinho que melhora a função objetivo e o coloca como corrente
'''
def hillClimbingA(board):
  current = copy.deepcopy(board)
  currentCount = 0
  while True:
    hasChanged = False
    allNeighbors = neighbors(current)
    for curNeighbor in allNeighbors:
      if(attacks(curNeighbor) < attacks(current)):
        current = curNeighbor
        currentCount = currentCount + 1
        hasChanged = True
        break
    if(hasChanged == False): return current, attacks(current), currentCount


# Questão 3, item b)
####################

'''
Retorna o nó corrente final do algoritmo de hill climbing, o número de ataques (para saber se é solução ótima),
e o número de nós correntes gerados
Essa função considera todos os vizinhos do nó atual e escolhe o melhor possível
'''
def hillClimbingB(board):
    current = copy.deepcopy(board)
    currentCount = 0
    while True:
        candidates = []
        currentValue = attacks(current)
        min = currentValue
        allNeighbors = neighbors(current)

        for curNeighbor in allNeighbors:
            value = attacks(curNeighbor)
            if value <= min:
                candidates.append(curNeighbor)
                min = value

        if min == currentValue:
            return current, attacks(current), currentCount
        else:
            i = random.randint(0, len(candidates)-1)
            current = candidates[i]
            currentCount = currentCount + 1


# Questão 3, item c)
####################

'''
Realizamos vários testes para cada algoritmo e cada tamanho
de tabuleiro
'''

# Teste 1, Tabuleiro N = 4, hill climbing A, número de execuções: 10, média de iterações: 2.33
# print(hillClimbingA(board(4)))

# Teste 2, Tabuleiro N = 4, hill climbing B, número de execuções: 6, média de iterações: 3
# print(hillClimbingB(board(4)))

# Teste 3, Tabuleiro N = 8, hill climbing A, número de execuções: 6, média de iterações: 5.5
# print(hillClimbingA(board(8)))

# Teste 4, Tabuleiro N = 8, hill climbing B, número de execuções: 4, média de iterações: 4.77
# print(hillClimbingB(board(8)))

# Teste 5, Tabuleiro N = 16, hill climbing A, número de execuções: 25, média de iterações: 12.25
# print(hillClimbingA(board(16)))

# Teste 6, Tabuleiro N = 16, hill climbing B
# Não conseguimos um resultado para este teste
# print(hillClimbingB(board(16)))

# Teste8, Tabuleiro N = 32 hill climbing A
# Não conseguimos um resultado para este teste
# print(hillClimbingA(board(32)))

# Teste 7, Tabuleiro N = 32, hill climbing B, número de execuções: 15, média de iterações: 41
# print(hillClimbingB(board(32)))


# Questão 3, item d)
####################

'''
Concluimos que o algoritmo é inadequado para valores elevados de N.
Mesmo para valores mais baixos, múltiplas tentativas são necessárias,
o que prejudica a sua praticidade.
'''


# Questão 4, item a)
####################

'''
Retorna o melhor nó encontrado dentro do número máximo de iterações estipulado.
Além disso, retorna um booleano indicando se o nó encontrado é uma solução
para o problema das N rainhas, e o número de iterações até chegar nesse nó.
'''
def simulatedAnnealing(board,tempInicial,maxIt,fatorDecaimento):
  current = board
  best = current
  iteracoes = 0
  T = tempInicial

  while iteracoes < maxIt and attacks(best) != 0:
    iteracoes += 1
    currentNeighbors = neighbors(current)
    next = currentNeighbors[random.randint(0, len(currentNeighbors)-1)]
    E = attacks(next) - attacks(current)
    if E <= 0:
      current = next
      if attacks(current) < attacks(best):
        best = current
    elif math.exp(-E/T) > random.random():
        current = next

    # Para evitar erro de floating point
    Tnovo = fatorDecaimento*T
    if Tnovo > 0:
      T = Tnovo

  encontrou = attacks(best) == 0

  return best, encontrou, iteracoes

# Questão 4, item b)
####################

'''
Para N = 4:
A chamada a seguir com esses parâmetros sempre retorna uma solução
O número de iterações variou muito pouco com a mudança na temperatura
inicial, mas fatores de decaimento menores chegaram ao resultado em
menos iterações. Fatores de decaimento muito próximos de 1 (como 0.98)
podem não chegar à solução.
'''

# teste41 = simulatedAnnealing(board(4),2,300,0.2)
# print(teste41)

'''
Para N = 8:
A chamada a seguir funciona na grande maioria das vezes.
A mudança na temperatura inicial e fator de aceleramento não afetou em
quase nada o número de iterações. O fator principal foi o limite
de iterações. Mesmo com 10000 como o limite, alguns tabuleiros
não encontram solução, mas isso é raro. A grande maioria atinge
o resultado em menos de 1000 passos.
'''

# teste42 = simulatedAnnealing(board(8),50,10000,0.24)
# print(teste42)

# Questão 4, item c)
####################

# Para N = 16:
# teste43 = simulatedAnnealing(board(16),50,10000,0.24)
# print(teste43)

# Para N = 32:
# teste44 = simulatedAnnealing(board(32),50,10000,0.24)
# print(teste44)

'''
Para ambos os valores novos de N, a frequência de acertos
caiu consideravelmente, enquanto o número médio de iterações
subiu, sendo em torno de 3000 para N = 16 e 8000 para N = 32.
'''

# Questão 5
###########

'''
O algoritmo de simulated annealing é consideravelmente mais
confiável que o de hill climbing, e retorna soluções corretas
com mais frequência, mas requer que os parâmetros sejam
escolhidos corretamente, o que pode não ser prático em certas
situações.
'''