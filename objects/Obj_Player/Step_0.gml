//Movimentação
// W - Cima
if keyboard_check(ord("W")) {
    y -= 2;
}

// S - Baixo
if keyboard_check(ord("S")) {
    y += 2;
}

// A - Esquerda
if keyboard_check(ord("A")) {
    x -= 2;
    image_xscale = -1; // Vira o sprite para a esquerda
}

// D - Direita
if keyboard_check(ord("D")) {
    x += 2;
    image_xscale = 1; // Vira o sprite para a direita
}