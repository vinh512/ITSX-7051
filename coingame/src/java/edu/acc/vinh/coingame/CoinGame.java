package edu.acc.vinh.coingame;

import java.text.DecimalFormat;

public class CoinGame {
    
    private int gameCounter = 1;
    int score = 0;
    String result;
     
//    1) we want to instantiate the game object
//    2) we use the instance to run the method flipCoin()
//    3) we return that result        

    public CoinGame() {
        
    }
    
    public String getResult(String playerChoice) {
        
        result = getCoinFlip(); 
        
        if (playerChoice.equals(result)) {
            score++;
            return String.format("You chose %s.<br>Computer flipped %s.<br>You WIN!", playerChoice, result);
        } else {
            return String.format("You chose %s.<br>Computer flipped %s.<br>You LOSE!", playerChoice, result);
        }
    }
    
    public int getScore() {
        return score;
    }
     
    public int getGameCounter() {
        return gameCounter;
    }
    
    public String getWinPercentage() {
        double winPercentage = ((double)this.score / this.gameCounter) * 100;
        DecimalFormat numberFormat = new DecimalFormat("#.##");
        return numberFormat.format(winPercentage);
    }
      
    public String getCoinFlip() {
        return coinFlip();
    }
    
    public String coinFlip() {
        gameCounter++;
        return (Math.random() <= 0.5) ? "Heads" : "Tails";
    }
    
    @Override 
    public String toString() {
        return "yo";
    }
}
