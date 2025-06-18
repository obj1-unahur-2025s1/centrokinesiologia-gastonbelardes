import Paciente.*

class Aparato {

    const property color = "blanco"

    method puedeSerUsadoPor(unPaciente) {
        return true
    }

    method valorQueSumaFortaleza(unPaciente) {
        return 0
    }

    method valorQueRestaDolor(unPaciente) {
        return 0
    }

    method efectoDeUso(unPaciente)

    method necesitaMantenimiento() = false

    method recibirMantenimiento() {}
}


class Magneto inherits Aparato {
    
    var imantacion = 800

    override method valorQueRestaDolor(unPaciente) {
        return unPaciente.conocerNivelDolor() * 0.10
    }
    override method efectoDeUso(unPaciente){
        imantacion = 0.max(imantacion - 1 )
    }

    override method necesitaMantenimiento() {
        return imantacion < 100
    }
    
    override method recibirMantenimiento() {
        imantacion = 800.min(imantacion + 500)
    }
}

class Minitramp inherits Aparato {
    override method puedeSerUsadoPor(unPaciente) {
        return unPaciente.conocerNivelDolor() < 20
    }
    override method valorQueSumaFortaleza(unPaciente) {
        return unPaciente.edad() * 0.1
    }

    override method efectoDeUso(unPaciente) {}
   
    
}

class Bicicleta inherits Aparato {

    var cantTornillos = 0
    
    var cantAceite = 0

    override method puedeSerUsadoPor(unPaciente) {
        return unPaciente.edad() > 8
    }
    override method valorQueRestaDolor(unPaciente) {
        return 4
    }
    override method valorQueSumaFortaleza(unPaciente) {
        return 3
    }

    override method efectoDeUso(unPaciente){
        if(unPaciente.conocerNivelDolor()>30){
            cantTornillos + 1
        }
        if(unPaciente.edad().between(30,50)){
            cantAceite + 1
        }
    
    }

    override method necesitaMantenimiento(){
        return cantTornillos >= 10 || cantAceite >= 5
    }

    override method recibirMantenimiento(){
        cantTornillos = 0
        cantAceite = 0

    }

}


