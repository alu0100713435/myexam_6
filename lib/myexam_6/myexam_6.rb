class Preguntas
	
	attr_accessor :pregunta

	def initialize pregunta
 		@pregunta = pregunta
	end

end

class SeleccionSimple < Preguntas

	attr_accessor :respuestas

	def initialize pregunta, respuestas
 		super(pregunta)
		@respuestas = respuestas
	end
	
	def to_s
		 "#{@pregunta}\n\n Respuestas: \n a:#{@respuestas[0]}\n b:#{@respuestas[1]}\n c:#{@respuestas[2]}\n d:#{@respuestas[3]}\n\n"
	end 
end

class VerdaderoFalso < Preguntas

	attr_accessor :respuestas
	
	def initialize pregunta
		super(pregunta)
		@respuestas = ["Verdadero","Falso"]
	end	
	
	def to_s
		"#{@pregunta}\n\n Respuestas:\n a: Verdadero \n b: Falso\n\n	"
	end
end
