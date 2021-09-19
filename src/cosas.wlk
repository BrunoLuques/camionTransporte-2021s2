import camion.*

object knightRider {
	method peso() {return 500}
	method nivelPeligrosidad() {return 10}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() {return 800}
	method nivelPeligrosidad() {return if (transformadoEnAuto) {15} else {30}}
	method transformar() {transformadoEnAuto = not transformadoEnAuto}
}

object paqueteDeLadrillos {
	var cantidad = 0
	
	method asignarCantidad(cuantos){cantidad = cuantos}
	method peso() {return 2 * cantidad}
	method nivelPeligrosidad() {return 2}
}

object arenaAGranel {
	var peso = 0
	
	method asignarPeso(nuevoPeso){peso = nuevoPeso}
	method peso() {return peso}
	method nivelPeligrosidad() {return 1}
}

object bateriaAntiaerea {
	var estaConMisiles = true
	
	method peso(){
		return if (estaConMisiles) 300 else 200
	}
	
	method nivelPeligrosidad() {
		return 
			if (estaConMisiles) 100 else 0
	}
	
	method descargarMisiles(){estaConMisiles = not estaConMisiles}
}

object contenedorPortuario{
	/*un contenedor puede tener otras cosas adentro. 
	El peso es 100 + la suma de todas las cosas que estén adentro. 
	Es tan peligroso como el objeto más peligroso que contiene. 
	Si está vacío, su peligrosidad es 0.*/
	var peso = 100
	var nivelPeligrosidad = 0
	const property carga = []
	
	method cosas(){return carga}
	method peso(){return peso}
	method nivelPeligrosidad(){return nivelPeligrosidad}
	
	method cargar(cosa){
		carga.add(cosa)
		peso += cosa.peso()
		nivelPeligrosidad =	carga.max({elemento => elemento.nivelPeligrosidad()}).nivelPeligrosidad()
	}
	
	method descargar(cosa){carga.remove(cosa)}
	
} 

object residuosRadioactivos{
	/*el peso es variable y su peligrosidad es 200*/
	var peso = 0
	
	method peso(){return peso}
	method asignarPeso(nuevoPeso){peso = nuevoPeso}
	method nivelPeligrosidad(){return 200}
}

object embalajeDeSeguridad{
	/*Es una cobertura que envuelve a cualquier otra cosa. 
	El peso es el peso de la cosa que tenga adentro. 
	El nivel de peligrosidad es la mitad del nivel de lo que envuelve.*/
	var peso = 0
	var nivelPeligrosidad = 0
	
	method peso(){return peso}
	method nivelPeligrosidad(){return nivelPeligrosidad}
	method envolver(cosa){
		peso = cosa.peso()
		nivelPeligrosidad = cosa.nivelPeligrosidad() / 2
	}
}











