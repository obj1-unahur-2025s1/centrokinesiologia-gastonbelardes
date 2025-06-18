import Aparatos.*
import Paciente.*

object centro {
    const aparatos = []
    const pacientes = #{}

    method agregarPaciente(unPaciente){
        pacientes.add(unPaciente)
    }

    method agregarAparato(listaAparatos){
        listaAparatos.addAll(listaAparatos)
    }

    method coloresDeAparatos() = aparatos.map({a=>a.color()}).asSet()

    method pacientesMenoresDe8() = pacientes.filter({p=>p.edad()<8})

    method pacientesQueNoPuedenHacerRutina() = pacientes.count({p=>!p.puedeRealizarRutina()})

    method estaEnOptimasCondiciones() = aparatos.all({a=>!a.necesitaMantenimiento()})

    method estaComplicado() = self.aparatosParaMantenimiento().size() >= aparatos.size() /2

    method aparatosParaMantenimiento() = aparatos.filter({a=>a.necesitaMantenimiento()}).size()

    method visitaTecnica() {self.aparatosParaMantenimiento().forEach({a=>a.realizarMantenimiento()})}
}