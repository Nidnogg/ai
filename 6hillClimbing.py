from random import randint

'''Returns a board of size N'''
def board(N):
  board = []
  for x in range(0, N):
    column_size = randint(0, N-1)
    board.append(column_size)
  print("original board is " + str(board))
  return board
            
'''
Returns a list of sublists, each sublist 
being a neighbor to the current node
''' 
def neighbors(board):
  neighbors = []
  
  for x in board:
    i = board.index(x) 
    for y in range(0, len(board)):
      currentNeighbor = board
      if(x == y): 
        continue
      #print(currentNeighbor)
      print(currentNeighbor)
      currentNeighbor[i] = y
      neighbors.append(currentNeighbor)
    i = i + 1
    
  #print(neighbors)

  

def main():
  neighbors(board(4))

if __name__ == '__main__':
    main()