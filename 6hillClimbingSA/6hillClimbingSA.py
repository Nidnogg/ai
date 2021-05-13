
import random
import copy

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

def randomNeighbor(neighbors):
  #print("vizinho aleatório")
  #print(random.choice(neighbors))
  return random.choice(neighbors)

'''
Retorna número de ataques possíveis entre rainhas
'''
def attacks(board):
  numAttacks = 0
  #seen = []

  # Conflitos verticais são impossíveis devido a modelagem
  for i in range(0,len(board)):
    for j in range(i+1,len(board)):
      # Conflitos horizontais: ocorre entre rainhas com valores (linhas) iguais
      if board[i] == board[j]:
        numAttacks += 1
        #print("conflito entre ", i, "e ", j)
  	  # Conflitos diagonais: ocorre entre pares de rainhas cuja distância vertical e horizontal são iguais
      elif abs(j-i) == abs(board[j]-board[i]):
        numAttacks += 1
        #print("conflito entre ", i, "e ", j)

  return numAttacks


'''
Retorna o nó corrente final do algoritmo de hill climbing e o número de ataques (para saber se é solução ótima)
Essa função considera o primeiro vizinho que melhora a função objetivo e o coloca como corrente.
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

'''
Retorna o nó corrente final do algoritmo de hill climbing, o número de ataques (para saber se é solução ótima),
e o número de nós correntes gerados.
Essa função considera todos os vizinhos do nó atual e escolhe o melhor possível.
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

def main():
  #print(str("Teste 1, Tabuleiro N = 4, hill climbing A, nExecs média ~ 10, média de iterações ~ 2.33:"))
  #print(hillClimbingA(board(4)))

  #print(str("Teste 2, Tabuleiro N = 4, hill climbing B, nExecs média ~ 6, média de iterações ~ 3:"))
  #print(hillClimbingB(board(4)))

  #print(str("Teste 3, Tabuleiro N = 8, hill climbing A, nExecs média ~ 6, média de iterações ~ 5.5:"))
  #print(hillClimbingA(board(8)))

  #print(str("Teste 4, Tabuleiro N = 8, hill climbing B, nExecs média ~ 4, média de iterações ~ 4.77:"))
  #print(hillClimbingB(board(8)))

  #print(str("Teste 5, Tabuleiro N = 16 hill climbing A, nExecs média ~ 25, média de iterações ~ 12.25:"))
  #print(hillClimbingA(board(16)))

  #print(str("Teste 6, Tabuleiro N = 16 hill climbing B, nExecs média ~ +++:"))
  #print("obs: não conseguimos um resultado para este teste")
  #print(hillClimbingB(board(16)))

  print(str("Teste 7, Tabuleiro N = 32, hill climbing B, nExecs média ~ 15, média de iterações ~ 41:"))
  print(hillClimbingB(board(32)))

  #print(str("Teste85, Tabuleiro N = 32 hill climbing A, nExecs média ~ +++:"))
  #print("obs: não conseguimos um resultado para este teste")
  #print(hillClimbingA(board(32)))



if __name__ == '__main__':
    main()