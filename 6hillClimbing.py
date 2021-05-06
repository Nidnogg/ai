
from random import randint

def board(N):
  board = []
  for x in range(0, N):
    column_size = randint(0, N-1)
    board.append(column_size)
  return board
    
def neighbors(board):
  neighbors = []
  for x in board:
    for y in range(0, len(board)):
      currentNeighbor = board
      if(y == x):
        continue
      #print(currentNeighbor.index(x))
      currentNeighbor[currentNeighbor.index(x)] = y 
    neighbors.append(currentNeighbor)

def main():
  neighbors(board(4))

if __name__ == '__main__':
    main()