//Movimentação
// W - Cima
if keyboard_check(ord("W")) {
    y -= 5;
}

// S - Baixo
if keyboard_check(ord("S")) {
    y += 5;
}

// A - Esquerda
if keyboard_check(ord("A")) {
    x -= 5;
    image_xscale = -1; // Vira o sprite para a esquerda
}

// D - Direita
if keyboard_check(ord("D")) {
    x += 5;
    image_xscale = 1; // Vira o sprite para a direita
}