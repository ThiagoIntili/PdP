import Formacion.formacion
import Deposito.deposito
import Locomotora.locomotora
//hacer clase "VagonDePasajeros" y despues subclase "Ancho" y "Angosto"?
object vagonAncho{
    const _largo = 0
    const _anchoUtil = 0

    method pasajeros() { return self.largo() * 10 }

    method largo() { return _largo }

    method anchoUtil() { return _anchoUtil }

    method esAncho() { true }

    method pesoMaximo() { return self.pasajeros() * 80 }

    method dePasajeros() { true }

    method esLiviano() { return self.pesoMaximo() < 2500 }
}

object vagonAngosto{
    const _largo = 0
    const _anchoUtil = 0

    method pasajeros() { return self.largo() * 8 }

    method largo() { return _largo }

    method anchoUtil() { return _anchoUtil }

    method esAncho() { false }

    method pesoMaximo() { return self.pasajeros() * 80 }

    method dePasajeros() { true }

    method esLiviano() { return self.pesoMaximo() < 2500 }
}

object vagonDeCarga{
    const _cargaMaxima = 0

    method cargaMaxima() { return _cargaMaxima }

    method pesoMaximo() { return self.cargaMaxima() + 160 }

    method esLiviano() { return self.pesoMaximo() < 2500 }
}