object laika {
	const raza = "salchicha" 
	var energia = 100
	method ladrar() { 
		return "guau"
	}
	method salirAPasear() {
		energia = energia - 20
	} 
	method raza() { 
		return raza
	} 
	method energia() { // getter 
		return energia 
	} 
	method energia(nuevaEnergia) { // setter 
		energia = nuevaEnergia
	} 
} 

object joaco {
	const mascota = laika 
	var energia = 100
	method salirAPasear() {
		mascota.salirAPasear() 
		energia -= 20  
	} 
	method comer(calorias) {
		energia += calorias // calorias es un numero y representa las calorias q aporta la comida q esta ingiriendo 
	}
	method hacerRutina() {
		self.comer(100) 
		self.salirAPasear()
	}
} 

// joaco.comer(100).salirAPasear() -- tira error ya q joaco.comer(100) no devuelve nada, hay q tener cuidado con lo q devuelve para seguir mandandole mensajes 
// self refernecia al objeto en el q estamos parados 

object ciro {
    var energia = 100 
    const raza = "salchicha"
    method ladrido() {
        return "guau"
    } 
    method salirAPasear() {
        energia -= 20
    }
    method raza() {
        return raza
    }
}

// los objetos son INMUTABLES 
// metodos q no devuelven algo pero cambian atributos -- verbos en infinitivo 
// metodos q devuelven algo -- sustantivos 
// usar siempre camelCase 
// metodos q devuelven un atributo -- getters 
// los metodos getters se deben llamar igual a sus atributos 
// metodos que escriben en atributos se llaman setters 
// tipado dinamico -- se fija el tipo q tiene cada cosa en cierto momento 
// igualdad de identidad (===) compara si es exactamente el mismo objeto 
// igualdad (==) compara si es lo mismo nada mas 
/*
error: 
    method ==(otroObjeto) {
        return true 
    }
*/
// value objects -- solo nos imporata el valor de ellos por ej -- {2, 4, "casa", etc}
// well known objects (WKO) -- objetos del tipo joaco, laika, ciro  
// estado interno -- los atributos que tiene el objeto 
// interfaz -- conjunto de mensajes q entiende un objeto (CONCEPTO IMPORTANTISIMO) 
// los objetos q mas se ven son los q no son WKO 
//para q un objeto haga algo le tengo q mandar el mensaje y para q el objeto entienda un mensaje tiene q tener a este mismo definido 
// los metodos pueden cambiar atributos o devolver tanto a estos mismos como a otros objetos 


// ejercicio clase 01 
// ejercicio 3 - Sueldo Pepe 

object pepe {
	const categoria = gerente 
	const faltas = 0
	method faltas() {
		return faltas 
	}
	const bonoPresentismo = bonoPresentismoPorFalta
	const bonoResultado = bonoResultadoFijo // placeholder 
	method bonoPresentismo() {
		return bonoPresentismo.sueldo(self) // polimorfismo (no me importa el objeto q sea, si entiende el mensaje va)
	}
	method bonoResultado() {
		return bonoResultado.sueldo(self) // polimorfismo (no me importa el objeto q sea, si entiende el mensaje va)
	}
	method neto() {
		return categoria.neto()
	}
	method sueldo() {
		return self.neto() + self.bonoPresentismo() + self.bonoResultado()  
	}

}

object bonoResultadoPorcentaje {
	method sueldo(empleado) {
		return empleado.neto() * 0.1 
	}
} 

object bonoResultadoFijo {
	method sueldo(empleado) {
		return 80
	}
}

object bonoPresentismoPorFalta {
	method sueldo(empleado) {
		const faltas = empleado.faltas() 
		if(faltas == 0) {
			return 100
		} else if (faltas == 1) {
			return 50 
		} else {
			return 0
		}
	}
}

object cadete {
	const neto = 1500
	method neto() {
		return neto
	}
} 
object gerente {
	const neto = 1000
	method neto() {
		return neto
	}
} 

// polimorfismo -- por ahora q no me importa quien me habla mientras me respondan lo q estoy consultando 

// de quien es la responsabilidad de hacer algo? 
// quien es el que tiene la informacion minima e indispensable? 

