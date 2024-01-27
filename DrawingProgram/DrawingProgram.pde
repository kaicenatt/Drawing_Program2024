int brushSize = 10;
color currentColor = color(0);
color[] colors = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255)};
int currentColorIndex = 0;

void setup() {
  size(400, 400);
  background(255);
  
  drawColorSelectors();
  drawBrushSizeSelector();
}

void draw() {
  // Drawing area
  if (mousePressed && mouseY < height) {
    if (mouseButton == LEFT) {
      fill(currentColor);
      noStroke();
      ellipse(mouseX, mouseY, brushSize, brushSize);
    } else if (mouseButton == RIGHT) {
      erase(mouseX, mouseY, brushSize);
    }
  }
}

void erase(float x, float y, int size) {
  fill(255);
  noStroke();
  ellipse(x, y, size, size);
}

void mousePressed() {
  // Check color selection and erase function
  if (mouseY > height) {
    checkColorSelectors();
    checkBrushSizeSelector();
  }
}

void drawColorSelectors() {
  int colorSelectorSize = 30;
  for (int i = 0; i < colors.length; i++) {
    fill(colors[i]);
    rect(10 + i * (colorSelectorSize + 10), height + 10, colorSelectorSize, colorSelectorSize);
  }
}

void checkColorSelectors() {
  int colorSelectorSize = 30;
  for (int i = 0; i < colors.length; i++) {
    if (mouseX > 10 + i * (colorSelectorSize + 10) && mouseX < 10 + i * (colorSelectorSize + 10) + colorSelectorSize) {
      currentColor = colors[i];
      currentColorIndex = i;
    }
  }
}

void drawBrushSizeSelector() {
  fill(150);
  rect(200, height + 10, 30, 30);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("Size", 215, height + 25);
}

void checkBrushSizeSelector() {
  if (mouseX > 200 && mouseX < 230 && mouseY > height + 10 && mouseY < height + 40) {
    brushSize += 5;
    if (brushSize > 30) {
      brushSize = 5;
    }
  }
}
