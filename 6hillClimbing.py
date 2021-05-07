import random
import copy

'''Returns a board of size N'''
def board(N):
  board = []
  for x in range(0, N):
    column_size = random.randint(0, N-1)
    board.append(column_size)
  print("original board is " + str(board))
  return board
            
'''
Returns a list of sublists, each sublist 
being a neighbor to the current node
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
  print("printing neighbors")
  for x in neighbors:
    print(x)
  return neighbors


def randomNeighbor(neighbors):
  print("random neighbor")
  print(random.choice(neighbors))
  return random.choice(neighbors)


def main():
  neighbors(board(4))
  randomNeighbor(neighbors(board(4)))
  

if __name__ == '__main__':
    main()