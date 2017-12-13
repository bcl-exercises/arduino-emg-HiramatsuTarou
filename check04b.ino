int val=0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9800);
}

void loop() {
  // put your main code here, to run repeatedly:
  val=analogRead(0);
  Serial.println(val/4);
  delay(10);
}
