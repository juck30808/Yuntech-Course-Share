abstract class Game {
   abstract void initialize();
   abstract void startPlay();
   abstract void endPlay();
   public final void play(){
      initialize();
      startPlay();
      endPlay();
   }
}
class MapleStoy extends Game {
   void endPlay() {
      System.out.println("MapleStoy Finished!\n");}
   void initialize() {
      System.out.println("MapleStoy Initialized!");}
   void startPlay() {
      System.out.println("MapleStoy Started. Enjoy!");}
}
class GTA extends Game {
   void endPlay() {
      System.out.println("GTA Finished!\n");}
   void initialize() {
      System.out.println("GTA Initialized!");}
   void startPlay() {
      System.out.println("GTA Started. Enjoy!");}
}

public class main {
   public static void main(String[] args) {
      Game game = new MapleStoy();
      game.play();
      game = new GTA();
      game.play();      
   }
}
