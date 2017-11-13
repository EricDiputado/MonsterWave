//CONSTANTS
final int LEFT_I = 0, RIGHT_I = 1, ATTACK_I = 2, DASH_I = 3;
final char LEFT_C = 'a', RIGHT_C = 'd', ATTACK_C = 'j', DASH_C = 'k';

final boolean[] buttonPressed = new boolean[4];
final HashMap<Character, Integer> pressedMap = new HashMap<Character, Integer>(){{
  put(LEFT_C, LEFT_I);
  put(RIGHT_C, RIGHT_I);
  put(ATTACK_C, ATTACK_I);
  put(DASH_C, DASH_I);
}};

void keyPressed(){
  Integer i = pressedMap.get(key);
  if (i != null){
    buttonPressed[i] = true;
  }
}

void keyReleased(){
  Integer i = pressedMap.get(key);
  if (i != null){
    buttonPressed[i] = false;
  }
}

boolean isPressed(char button){
  Integer i = pressedMap.get(button);
  return i != null && buttonPressed[i];
}