import Formacion.formacion
import Vagones.*
import Locomotora.locomotora

object deposito {
  var _formaciones = { formacion }
  var _locomotoras = { locomotora }

  method formaciones() { return _formaciones}

  method vagonesMasPesados() { return self.formaciones().map({ formacion => formacion.vagonMasPesado()}) }

  method necesitaConductorExperimentado() { return self.formaciones().any({ formacion => formacion.esCompleja()}) }

  method agregarLocomotoraUtil(formacion) { formacion.add( self.locomotorasDeposito().locomotoraUtil()) }
//si hay mas de 1 locomotora util como decide cual poner
  method locomotorasDeposito() { return _locomotoras }
  //falto el 12
}
