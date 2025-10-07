const malaria500 = new EnfermedadInfecciosa(celulasAmenazadas = 500)
const malaria800 = new EnfermedadInfecciosa(celulasAmenazadas = 500)
const otitis100 = new EnfermedadInfecciosa(celulasAmenazadas = 100)
object lupus10000 {
  var cantidadAfecciones = 0
  method afectar(persona) {
        persona.destruirCelulas(10000)
        cantidadAfecciones += 1 
  }
  method esAgresivo() = cantidadAfecciones >= 30 
  method celulasAmenazadas() = 10000 
  method esAgresivo(_persona) = cantidadAfecciones // se usa el guion bajo enfrente para indicar que es un atributo q debo poner pero no voy a usar 
}

object logan {
  const enfermedades = #{malaria500, otitis100, lupus10000}
  method cantidadDeCelulasAmenazadasPorEnfermedadesAgresivas() = enfermedades.filter({ enfermedad => enfermedad.esAgresivo() }).sum({ enfermedad => enfermedad.celulasAmenazadas() })
  var temperatura = 36 
  var celulas = 3690000
  method vivirUnDia() {
    enfermedades.forEach({ enfermedad => enfermedad.afectar(self) }) // ejecuta el mensaje en cada obeto del set 
    // es como una funcion lambda solo q aca el forEach tiene efecto, en cambio el map no 
    // bloque que entiende apply(item)
  }
  method contraer(enfermedad) {}
  method estaEnComa() = temperatura == 45 or celulas < 1000000 
  method aumentarTemperatura(cantidad) {
    temperatura = (temperatura + cantidad).min(45)
  }
  method destruirCelulas(cantidad) {
    celulas = (celulas - cantidad).max(0)
  }
  method enfermedadMasAfecta() = lupus10000
  method celulas() = celulas
  method temperatura() = temperatura
  } 

  // hay mucha logica repetida 
  // se puede mejorar 
// para evitar esta repeticion podemos usar clases 
// una clase es un molde para los objetos 

class EnfermedadInfecciosa {
  var celulasAmenazadas 
  method esAgresivo(persona) = persona.celulas() * 0.1  <= 100000
  method celulasAmenazadas()  = 0 
  method afectar(persona) {} 
  method reproducirse() {
    celulasAmenazadas *= 2 
  }
} 

// existen las colecciones q funcionan como arrays 
// ademas existen conjuntos q se declaran con {} 
// los sets/conjuntos no tienen orden osea no se les puede pedir el primero 
// listas tiene repetidos y orden 
// los sets no tienen repetidos ni orden 
// objetos --> WKO (well known objects) unicos y son instancias de una clase  
// clase --> es un molde para objetos 

object miApply { 
  method apply(enfermedad) {
    enfermedad.afectar(logan)
  }
} 

class Paciente {
  const enfermedades 
  var temperatura = 37 
  var celulas 
  method contraer(enfermedad) {
    enfermedades.add(enfermedad)
  }
  method vivirUnDia() {
    enfermedades.forEach({ enfermedad => enfermedad.afectar(self) }) // ejecuta el mensaje en cada obeto del set 
    // es como una funcion lambda solo q aca el forEach tiene efecto, en cambio el map no 
    // bloque que entiende apply(item)
  }
  method estaEnComa() = temperatura == 45 or celulas  
  method aumentarTemperatura(cantidad) {
    temperatura = (temperatura + cantidad).min(45)
  }
  method destruirCelulas(cantidad) {
    celulas = (celulas - cantidad).max(0)
  }
  method enfermedadMasAfecta() = lupus10000
  method celulas() = celulas
  method temperatura() = temperatura
  method contraerEnfermedad(enfermedad) {
    enfermedades.add(enfermedad)
  }
} 
const frank = new Paciente(enfermedades = #{}, temperatura = 36.8, celulas = 3000000)