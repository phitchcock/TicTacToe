##Tic Tac Toe##
###Project Requirements###

1. As a user, I want to view playing board
2. As a user, I want to see whose turn it is
3. As a user, I want to figure out if I touched a specific label
4. As a user, I want to determine if user has won the game
5. As a user, I want to show the winner of a game
6. As a user, I want to drag an X or an O to a grid position TODO
7. As a user, I want to limit the amount of time a user takes to make a move TODO
8. As a user, I want to display help for users who have never seen Tic, Tac, Toe.
9. As a user, I want to play the computer TODO

outlet created for button, starting with button0 to reflect index number in the array

button action to select the button tap and change image
  creating a varialbe to refer to the user tap
  ```
  var changeImage = UIImage()
  ```
  set the image on the button - update on image tap
  ```
  changeImage = UIImage(named: "x.png")
  ```
  connect all buttons to the same action
  ```
  @IBAction func onButtonPressed(sender: AnyObject) {
    var changeImage = UIImage()
    changeImage = UIImage(named: "x.png")   
  }
  ```
create a variable to track what turn we are on startNumber = 1, keeps counting startNumber++, starting with O (will be odd) first and X (will be even) second
  use % for remainer
  if == 0 (this needs to be even)
    x
  else (this needs to be odd)
    o
  ```
  var changeImage = UIImage()

  if (startNumber % 2 == 0) {
      changeImage = UIImage(named: "x.png")
  } else {
      changeImage = UIImage(named: "o.png")
  }

  startNumber++

  sender.setImage(changeImage, forState: .Normal)
 ```
create array to keep track of boxes tapped initialized at 0 for each button 9 slots. Zero = empty, 1 = o and 2 = x - var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
  check if button has been pressed has image
  utilze tag to set a number to the button - base it on array index
  refer to the tag by using sender.tag(the button tapped)
  check gameState to see if the button slot is = 0 
  update gameState with number change, set o to odd and x to even
  ```
  if (gameState[sender.tag] == 0) {
    var changeImage = UIImage()
    if (startNumber % 2 == 0) {
        changeImage = UIImage(named: "x.png")
        gameState[sender.tag] = 2
        println("\(gameState)")

    } else {
        changeImage = UIImage(named: "o.png")
        gameState[sender.tag] = 1
        println("\(gameState)")
    }
    startNumber++
    sender.setImage(changeImage, forState: .Normal)
  }
  ```
determine winner based on ways to win, 3 horizontal, 3 vertical and 2 diagnal. Create nested arrays loop through each tap to see if winner or not
  let winningCombinations = [horizontal [0, 1, 2], [3, 4, 5], [6, 7, 8], vartical [0, 3, 6], [1, 4, 7], [2, 5, 8], diaganal [0, 4, 8], [2, 4, 6]]
  loop through winningCombinations
  check gameState in winningCombinations by index gameState[combination[0]]
  need winner var set to 0 









