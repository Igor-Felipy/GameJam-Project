// --- CONFIGURAÇÃO DE PROGRESSÃO ---
max_esferas_desbloqueadas = 5; // Defina como 5 para testar o círculo completo agora
limite_absoluto = 5;           

// --- MUNIÇÃO ---
esferas_atuais = 5;       // Começa cheio

// --- VISUAL (ÓRBITA) ---
raio_orbita = 40;         // Distância das esferas até o player (aumente se quiser mais longe)
velocidade_rotacao = 2;   // Quão rápido elas giram ao redor do player
angulo_atual = 0;         // Variável interna para controle do giro

// --- RECARGA E TIRO ---
tempo_recarga = 60;       // 60 frames = 1 segundo para recuperar uma esfera
timer_recarga = 0;        
cooldown_tiro = 0;        
delay_entre_tiros = 10;   
depth = obj_player.depth - 1; // Fica na frente do player (ou use +1 para trás)