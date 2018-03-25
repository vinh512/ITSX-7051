package edu.acc.vinh.coingame;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class CoinGame {

    private int gameCounter;
    private int score;
    private double winPercentage;
    private String coinResult;

    public String getResult(String playerChoice) {
        gameCounter++;
        coinResult = getCoinFlip();
        
        String msg = String.format("You chose %s<br>Computer flipped %s<br>You ", playerChoice, coinResult);
        
        if (playerChoice.equals(coinResult)) {
            score++;
            return msg + " <span class='win'>WIN</span>!";
        } else {
            return msg + " <span class='lose'>LOSE</span>!";
        }
    }

    public String getWinPercentage() {
        // No games have been played so cannot divide by zero. Return 0 to prevent NaN
        if (gameCounter == 0) {
            return "0.0";
        }
        
        // Calculate win percentage as a double
        winPercentage = ((double)score / gameCounter) * 100;
        
        // Format decimal to have only one trailing value
        NumberFormat formatter = new DecimalFormat("#0.0");        
        return formatter.format(winPercentage);
    }

    public String getCoinFlip() {
        return (Math.random() <= 0.5) ? "Heads" : "Tails";
    }

    public int getScore() {
        return score;
    }

    public int getGameCounter() {
        return gameCounter;
    }

    @Override
    public String toString() {
        return "This is the CoinGame object";
    }
}
