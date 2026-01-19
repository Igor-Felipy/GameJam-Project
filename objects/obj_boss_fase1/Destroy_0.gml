// Código para dar a Esfera (que fizemos antes)
if (instance_exists(obj_sistema_esferas)) {
    with (obj_sistema_esferas) {
        if (max_esferas_desbloqueadas < limite_absoluto) {
            max_esferas_desbloqueadas += 1;
            esferas_atuais = max_esferas_desbloqueadas; // Já enche a munição
        }
    }
}

// Herda a destruição do pai (Opcional, pois o Step do pai já destrói, 
// mas se tiver efeitos de partícula na morte do pai, é bom chamar)
event_inherited();