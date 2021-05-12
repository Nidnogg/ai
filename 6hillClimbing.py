import random
import copy

'''
Retorna tabuleiro de tamanho N*N
As rainhas estão sempre em colunas diferentes e são identificadas pelo número da sua coluna
A representação é feita guardando a linha de cada rainha
'''
def board(N):
  board = []
  for x in range(0, tam):
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


def hillClimbingA(board):
  current = copy.deepcopy(board)
  while True:
    hasChanged = False
    allNeighbors = neighbors(current)
    for curNeighbor in allNeighbors:
      if(attacks(curNeighbor) <= attacks(current)):
        current = curNeighbor
        hasChanged = True
        break

    if(hasChanged == False): return current

def main():
  #neighbors(board(4))
  #attacks(randomNeighbor(neighbors(board(4))))
  #print(attacks([3,2,1,2]))
  #print(attacks([2,0,3,1]))
  print(hillClimbingA([3,0,3,1]))
  #print(hillClimbingA([2,0,3,1]))



if __name__ == '__main__':
    main()