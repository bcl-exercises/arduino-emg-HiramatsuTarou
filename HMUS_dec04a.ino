//x,y,z,wの4つの変数を用意し、初期値を０とする
int x=0;
int y=0;
int z=0;
int w=0;

void setup(){
  //シリアル通信開始
  Serial.begin(9600);
}

void loop(){
  //アナログ入力ピン0,1,2,3を
  //それぞれx,y,z,wに対応させる
  //値を４で割って最大値255にする
  x=analogRead(0)/4;
  y=analogRead(1)/4;
  z=analogRead(2)/4;
  w=analogRead(3)/4;

  //Processingから合図のデータが
  //一つ送られてきたらという条件
  if(Serial.available()>0){
    //x,y,z,wの順番で値を送る
    Serial.write(x);
    Serial.write(y);
    Serial.write(z);
    Serial.write(w);
    //先ほどのProcessingからの
    //合図のデータを読み込む
    Serial.read();
  }
}
