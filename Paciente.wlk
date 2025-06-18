class Paciente {
  var  property edad
  
  var   nivelDolor

  var   nivelFortalezaMuscular

  const rutina = []
  
  

  method puedeUsar(unAparato) =unAparato.puedeSerUsadoPor(self)

  method usarAparato(unAparato) {
    if(!self.puedeUsar(unAparato)) {
      self.error("El paciente no puede usar este aparato")
    }
    unAparato.efectoDeUso(self)
    nivelFortalezaMuscular += unAparato.valorQueSumaFortaleza(self)

    nivelDolor = 0.max(nivelDolor - unAparato.valorQueRestaDolor(self))
  }

  method conocerNivelDolor() {
    return nivelDolor
  }
  
  method conocerNivelFortalezaMuscular() {
    return nivelFortalezaMuscular
  }

  method asignarRutina(listaDeAparatos) {
    
    rutina.addAll(listaDeAparatos)
  }

  method realizarRutina() {
    if(!self.puedeRealizarRutina()) {
      self.error("El paciente no puede realizar la rutina")
    }
    rutina.forEach({aparato => self.usarAparato(aparato)})
  }

  method puedeRealizarRutina() {
    return rutina.all({aparato => self.puedeUsar(aparato)})
  }
  
}

class Resistente inherits Paciente{
  override method realizarRutina(){
    super()
    nivelFortalezaMuscular += rutina.size()
  }


}


class Caprichoso inherits Paciente{

  override method puedeRealizarRutina() = super() && self.hayAparatoRojo()

  method hayAparatoRojo() = rutina.any({a=>a.color() == "rojo"})

  override method realizarRutina(){
    super()
    super()
  }




}


class RápidaRecuperación inherits Paciente{
override method realizarRutina(){
  super()
  nivelDolor = nivelDolor - coecifienteDeRecuperacion.valor()
}


}

object coecifienteDeRecuperacion{
  var property valor = 3

}