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
	const estaConMisiles = true
	
	method peso(){
		return if (estaConMisiles) 300 else 200
	}
	
	method nivelPeligrosidad() {
		return 
			if (estaConMisiles) 100 else 0
	}
}

object contenedorPortuario{} // hacer

object residuosRadioactivos{
	const peso = 0
	
	method peso(){return peso}
	method nivelPeligrosidad(){return 200}
}

object embalajeDeSeguridad{
	/*Es una cobertura que envuelve a cualquier otra cosa. 
	El peso es el peso de la cosa que tenga adentro. 
	El nivel de peligrosidad es la mitad del nivel de peligrosidad de lo que envuelve.*/
	
}
