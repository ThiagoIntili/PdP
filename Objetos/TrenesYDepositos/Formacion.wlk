import Deposito.deposito
import Vagones.*
import Locomotora.locomotora

object formacion{
  var pasajeros = 0
  var _locomotoras = {locomotora}
  var _vagones = [vagonAncho, vagonAngosto, vagonDeCarga]

  method vagones() { return _vagones }

  method locomotoras() { return _locomotoras }

  method agregarVagon(vagonAgregado) {self.vagones().add(vagonAgregado) }

  method agregarLocomotora(locomotoraAgregada) { self.locomotoras().add(locomotoraAgregada) }

  method cantidadVagones() {return self.vagones().size()}

  method pasajeros() { return self.vagones().sum({ vagon => vagon.pasajeros()}) }
//los vagones de carga suman 2 pasajeros (los guardas)?
  method vagonesLivianos() { return self.vagones().count({ vagon => vagon.esLiviano()}) }

  method velocidadMaxima() { return self.locomotoras().min({ locomotora => locomotora.velocidadMaxima()}) }
//nuevamente velocidadMaxima() porque me piden el numero, no la locomotora
  method esEficiente() {return self.locomotoras().all({ locomotora => locomotora.esEficiente()}) }

  method puedeMoverse() {return self.arrastreUtilTotalLocmotoras() >= self.pesoMaximoTotalVagones() }

  method pesoMaximoTotalVagones() { return self.vagones().sum({ vagon => vagon.pesoMaximo()}) }

  method vagonMasPesado() { return self.vagones().max({ vagon => vagon.pesoMaximo()}) }
//hay logica repetida en la funcion anonima?
  method arrastreUtilTotalLocmotoras() { return self.locomotoras().sum({ locomotora => locomotora.arrastreUtil()}) }

  method cuantosKilosLeFaltanParaMoverse() { return (self.pesoMaximoTotalVagones() - self.arrastreUtilTotalLocmotoras()).max(0) }
//hay que devolver 0 si ya se puede mover? o devuelvo el negativo simbolizando lo que me sobra?
  method esCompleja() { return self.unidades() > 20 || self.pesoFormacion() > 10000 }

  method unidades() { return self.vagones().size() + self.locomotoras().size() }

  method pesoFormacion() { return self.vagones().sum({ vagon => vagon.pesoMaximo() }) + self.locomotoras().sum({ locomotora => locomotora.peso()}) }
  //de los vagones tomo el peso maximo
  method locomotoraUtil(locomotora) { 
    return !self.puedeMoverse() || self.locomotoras().agregarLocomotora(locomotora).locomotoras().puedeMoverse()}
    //este esta malk
}

