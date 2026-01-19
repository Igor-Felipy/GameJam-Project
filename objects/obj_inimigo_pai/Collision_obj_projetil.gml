// 1. LEVAR DANO
hp -= 1; // Ou use uma variável de dano do projétil: other.dano

// 2. FEEDBACK VISUAL (Piscar Branco)
flash_alpha = 1; 

// 3. DESTRUIR O TIRO
instance_destroy(other); // 'other' é o projétil que bateu