import Deposito.deposito
import Formacion.formacion
import Vagones.*

object locomotora{
    const _peso = 0
    const _pesoMaximoArrastrable = 0
    const _velocidadMaxima = 0

    method peso() { return _peso }

    method pesoMaximoArrastrable() { return _pesoMaximoArrastrable }

    method velocidadMaxima() { return _velocidadMaxima }

    method arrastreUtil() { return self.pesoMaximoArrastrable() - self.peso() }

    method esEficiente() { return self.pesoMaximoArrastrable() >= 5 * self.peso() }

    method locomotoraQueCumple() { return }
    //uso pesoMaximoArrastrable o arrastreUtil
}