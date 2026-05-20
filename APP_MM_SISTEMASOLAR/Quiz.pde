void desenhaQuiz(PGraphics g) {
  if (quizFim) {
    g.textSize(height*0.050); g.fill(255, 220, 50);
    g.text("Parabens!", width/2, height*0.28);
    g.textSize(height*0.035); g.fill(255);
    g.text("Voce acertou " + pontuacao + " de 5!", width/2, height*0.40);
    if (pontuacao == 5) { g.fill(100, 255, 100); g.text("Voce e um expert em planetas!", width/2, height*0.50); }
    else                { g.fill(200, 220, 255); g.text("Continue explorando o universo!", width/2, height*0.50); }

    boolean hoverJogar = mouseX > width*0.35 && mouseX < width*0.65 && mouseY > height*0.62 && mouseY < height*0.62 + height*0.07;
    g.fill(50, 100, 200); if (hoverJogar) { g.stroke(255); g.strokeWeight(3); } else { g.noStroke(); }
    g.rect(width*0.35, height*0.62, width*0.30, height*0.07, 12);
    g.fill(255); g.textSize(height*0.030); g.text("Jogar de novo", width/2, height*0.62 + height*0.035);

    boolean hoverVer = mouseX > width*0.35 && mouseX < width*0.65 && mouseY > height*0.72 && mouseY < height*0.72 + height*0.07;
    g.fill(70, 70, 70); if (hoverVer) { g.stroke(255); g.strokeWeight(3); } else { g.noStroke(); }
    g.rect(width*0.35, height*0.72, width*0.30, height*0.07, 12);
    g.fill(255); g.text("Ver planetas", width/2, height*0.72 + height*0.035);

    boolean hoverCred = mouseX > width*0.35 && mouseX < width*0.65 && mouseY > height*0.82 && mouseY < height*0.82 + height*0.07;
    g.fill(80, 50, 120); if (hoverCred) { g.stroke(255); g.strokeWeight(3); } else { g.noStroke(); }
    g.rect(width*0.35, height*0.82, width*0.30, height*0.07, 12);
    g.fill(255); g.text("Creditos", width/2, height*0.82 + height*0.035);
    g.strokeWeight(1);
    return;
  }

  g.textSize(height*0.026); g.fill(255, 220, 50);
  g.text("Pergunta " + (perguntaAtual+1) + " de 5", width/2, height*0.10);
  g.fill(255); g.textSize(height*0.038);

  if (perguntaAtual == 0) g.text("Qual planeta e conhecido\ncomo o Planeta Vermelho?", width/2, height*0.26);
  if (perguntaAtual == 1) g.text("Qual e o maior\nplaneta do Sistema Solar?", width/2, height*0.26);
  if (perguntaAtual == 2) g.text("Qual planeta possui\naneis mais visiveis?", width/2, height*0.26);
  if (perguntaAtual == 3) g.text("Qual planeta esta\nmais proximo do Sol?", width/2, height*0.26);
  if (perguntaAtual == 4) g.text("Qual planeta e conhecido\npor possuir agua e vida?", width/2, height*0.26);

  if (perguntaAtual == 0) desenhaOpcoes(g, "Venus", "Marte", "Jupiter", "Saturno", 1);
  if (perguntaAtual == 1) desenhaOpcoes(g, "Terra", "Saturno", "Jupiter", "Netuno", 2);
  if (perguntaAtual == 2) desenhaOpcoes(g, "Jupiter", "Marte", "Saturno", "Urano", 2);
  if (perguntaAtual == 3) desenhaOpcoes(g, "Mercurio", "Venus", "Terra", "Marte", 0);
  if (perguntaAtual == 4) desenhaOpcoes(g, "Netuno", "Terra", "Saturno", "Urano", 1);
}

void desenhaOpcoes(PGraphics g, String a, String b, String c, String d, int correto) {
  String[] ops = {a, b, c, d};
  for (int i = 0; i < 4; i++) {
    float bx = width*0.30;
    float by = height*0.42 + i * height*0.12;
    color cor = color(50, 80, 160);
    if (respondeu) { if (i == correto) cor = color(40, 170, 60); else cor = color(160, 50, 50); }
    boolean hover = !respondeu && mouseX > bx && mouseX < bx + width*0.40 && mouseY > by && mouseY < by + height*0.09;
    g.fill(cor);
    if (hover) { g.stroke(255); g.strokeWeight(3); } else { g.noStroke(); }
    g.rect(bx, by, width*0.40, height*0.09, 12);
    g.strokeWeight(1); g.fill(255); g.textSize(height*0.030);
    g.text(ops[i], width/2, by + height*0.045);
  }

  if (respondeu) {
    g.textSize(height*0.032);
    if (acertou) { g.fill(100, 255, 100); g.text("Correto! Muito bem!", width/2, height*0.90); }
    else         { g.fill(255, 110, 110); g.text("Ops! Tente lembrar!", width/2, height*0.90); }

    boolean hoverProx = mouseX > width*0.35 && mouseX < width*0.65 && mouseY > height*0.92 && mouseY < height*0.92 + height*0.07;
    g.fill(50, 140, 220);
    if (hoverProx) { g.stroke(255); g.strokeWeight(3); } else { g.noStroke(); }
    g.rect(width*0.35, height*0.92, width*0.30, height*0.07, 12);
    g.fill(255); g.textSize(height*0.030);
    g.text("Proxima ->", width/2, height*0.92 + height*0.035);
    g.strokeWeight(1);
  }
}
