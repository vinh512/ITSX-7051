package edu.acc.vinh.coingame;

public class CoinGame {

    private int gameCounter;
    private int score;
    double winPercentage = 0.0;
    private String result;

    public CoinGame(int score, int gameCounter) {
        this.score = score;
        this.gameCounter = gameCounter;
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

    public double getWinPercentage() {
        // No games have been played thereby cannot divide by zero so return 0 to prevent NaN
        if (gameCounter == 0) {
            return 0;
        }
        return (score / (double) gameCounter) * 100;
    }

    public String getCoinFlip() {
        return coinFlip();
    }

    public String coinFlip() {
        gameCounter++;
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
        return "yo";
    }
}
