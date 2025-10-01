// clase 2 ejercicio tamagotchi 

object tamagotchi {
    var estado = contento  
    var felicidad = 0
    var comidasEnMismoEstado = 0
    var juegosContentos = 0  
    var juguete = pelota
    method comer() { 
        estado.comer(self)
    } 
    method jugar() {
        estado.jugar(juguete, self)
    }
    method felicidad(valor) {
        felicidad = valor 
    }
    method felicidad() {
        return felicidad
    }
    method estado(valor) {
        estado = valor
    }
    method comidasEnMismoEstado() {
        return comidasEnMismoEstado
    }
    method comidasTrisites(valor) {
        comidasEnMismoEstado = valor
    }
    method aumentarFelicidad(aumento) {
        felicidad += aumento
    } 
    method modificarcomidasEnMismoEstado(cantidad) {  
        comidasEnMismoEstado += cantidad
    }
    method ponerseContento() {
        self.estado(contento)
        comidasEnMismoEstado = 0
    }
    method ponerseTriste() {
        self.estado(triste) 
        juegosContentos = 0
    }
    method aumentarJuegosContentos(aumento) {
        juegosContentos += aumento
    }
    method juegosContentos() {
        return juegosContentos
    }
    method ponerseHambriento() {
        estado = hambriento
    }

} 

object contento {
    method comer(tamagotchi)  {
        /*
        var felicidad = tamagotchi.felicidad() + 1
        tamagotchi.felicidad(felicidad)
        esto rompe el encapsulamiento de este objeto 
        */
        tamagotchi.aumentarFelicidad(1)
    }
    method jugar(juguete, tamagotchi) {
        juguete.jugar(tamagotchi)
        juguete.dañar(1)
        tamagotchi.aumentarJuegosContentos(1)
        if(tamagotchi.juegosContentos() == 3) {
            tamagotchi.ponerseHambriento() 
        }
    }
} 

object hambriento {
    method comer(tamagotchi) {
        tamagotchi.estado(contento) // este metodo esta encapsulado, solo lo conoce el tamagotchi 
    }
    method jugar(juguete, tamagotchi) {
        tamagotchi.aumentarFelicidad(-4)
        if(juguete == ratonDeGoma) {
            tamagotchi.ponerseContento()
            juguete.dañar(15)
        }
    }
} 

object triste {
    
    method comer(tamagotchi) { 
        tamagotchi.modificarComidasTristes(1)
        if(tamagotchi.comidasTrisites() == 3) {
            tamagotchi.ponerseContento()
        }
    }
    method jugar(juguete, tamagotchi) {
        tamagotchi.ponerseContento()
        juguete.dañar(tamagotchi.felicidad())
    }
}

object pelota { 
    var salud = 100 
    method jugar(tamagotchi) {
        tamagotchi.aumentarFelicidad(5) 
    }
    method dañar(daño) {
        salud -= daño
    }
} 

object piedra {
    var salud = 100 
    method jugar(tamagotchi) {
        tamagotchi.ponerseTriste()
    }
    method dañar(daño) {
        salud -= daño
    }
}

object ratonDeGoma {
    var salud = 100 
    method jugar(tamagotchi) {
        tamagotchi.aumentarFelicidad(3)
        tamagotchi.ponerseHambriento()
    }
    method dañar(daño) {
        salud -= daño
    }
}
// en este paradigma no modelamos la realidad 
// por eso aca le damos la responsabilidad a un estado 

/*
los 3 pilares del paradigma de objetos -- se te cae uno y se te cae el paradigma 
    - polimorfismo 
    - asignacion de responsabilidades
    - encapsulamiento  
*/

// atributo = objeto estas obligado a q el primero sea un atributo, no un objeto 

// terminar este ejercicio... 

