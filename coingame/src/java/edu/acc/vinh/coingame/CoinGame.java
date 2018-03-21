package edu.acc.vinh.coingame;

public class CoinGame {
    
    private int gameCounter = 0;
    private int wins = 0;
//    private String playerChoice;
    String result;
     
//    1) we want to instantiate the game object
//    2) we use the instance to run the method flipCoin()
//    3) we return that result        
    
    public CoinGame() {
        
    }
    
//    public String getPlayerChoice() {
//        return this.playerChoice;
//    }
    
    public String getResult(String playerChoice) {
        
        if (playerChoice.equals(getCoinFlip())) {
            wins++;
            return "You chose " + playerChoice + "! You WIN!";
        } else {
            return "You chose " + playerChoice + "! You LOSE!";
        }
        
//    return "yo this is it here: " + playerChoice + "!";

    }
    
    public int getWins() {
//        if (this.playerChoice.equals(this.getCoinFlip())) {
//            wins++;
//        }
        return wins;
    }
     
    public double getWinPercentage() {
        return this.wins / this.gameCounter;
    }
      
    public String getCoinFlip() {
        return coinFlip();
    }
    
    public String coinFlip() {
        this.gameCounter++;
        return (Math.random() <= 0.5) ? "Heads" : "Tails";
    }
    
    @Override 
    public String toString() {
        return "yo";
    }
}
