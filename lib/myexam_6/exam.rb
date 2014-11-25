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


Node = Struct.new(:value, :next, :prev)

class Lista

	attr_accessor :inicio, :final

	def initialize inicio
		@inicio = inicio
		@final = inicio
	end	

	def push_final(nodo)
		if @final == nil
			@final = nodo
			@inicio = nodo
		else			
			@final.next = nodo
			nodo.prev = @final			
			@final = nodo
		end
	end

	def push_inicio(nodo)
		if @inicio == nil
			@inicio = nodo
			@final = nodo
		else
			nodo.next = @inicio
			@inicio.prev = nodo
			@inicio = nodo
		end
	end
	     
	def pop_inicio()
		aux = @inicio
		@inicio = @inicio.next		
		return aux.value
	end

	def pop_final()
		aux = @final
		@final = @final.prev		
		return aux.value
	end	

	def getFinalValue()
		"#{@final.value}"
	end

	def to_s
		"#{@inicio.value}"
	end

	def getInicioNext()
		return @inicio.next
	end

	def getFinalNext()
		return @final.next
	end

	def getInicioPrev()
		return @inicio.prev
	end

	def getFinalPrev()
		return @final.prev
	end
end

		@p1 = SeleccionSimple.new("Salida del siguiente codigo: \nClass Xyz \n	def pots \n		@nice \n	end \nend", ["#<Xyz:0xa000208>","nil","0", "ninguna de las anteriores"])		
		@p2 = VerdaderoFalso.new("Definicion de un has en Ruby: \nhash_raro = \n	[1, 2, 3] => Object.new(), \n	Hash.new => :toto")	
		@p3 = SeleccionSimple.new("Salida del siguiente codigo: \nClass Array \n	def say_hi \n		HEY! \n	end \nend", ["1","bob","HEY!","ninguna de las anteriores"])
		@p4 = SeleccionSimple.new("Tipo de objeto en: \nclass Objeto \nend", ["Una instancia de la clase","una constante","un objeto","Ninguna de las anteriores"])
		@p5 = VerdaderoFalso.new("Es apropiado que una clase Tablero herede de una clase Juego")

		@node1 = Node.new(@p1)
		@node2 = Node.new(@p2)
		@node3 = Node.new(@p3)
		@node4 = Node.new(@p4)
		@node5 = Node.new(@p5)
		@lista = Lista.new(@node1)
		@lista.push_final(@node2)
		@lista.push_final(@node3)
		@lista.push_final(@node4)
		@lista.push_final(@node5)
	
		

class Examen
	
	attr_accessor :value, :correctas, :respuestas, :nota

	def initialize value
		@value = value
		@correctas = ["c","b","a","a","b"]
		#@respuestas = ["b","a","a","b","c"]
		@respuestas = ["nil","nil","nil","nil","nil"]
	end

	def to_s
		aux = @value.inicio
		i=1
		while i<6 do	
				puts "#{i} Pregunta: \n #{aux.value}\n"
				aux = aux.next
				i+=1
		end
	end

	def mostrar(i)
		aux = @value.inicio
		j=1
		while j<i do	
				aux = aux.next
				j+=1
		end
		puts "#{aux.value}"
	end

	def exam
		i=4
		k=0
		aux = @value.inicio
		(0..4).each do
			puts i
			puts "#{aux.value} \n\n Tu respuesta: "
			@respuestas[i] = gets.chomp
			system "clear"
			if @correctas[i] == @respuestas[i] then
					puts "correcto"
					sleep 1
					k+=1
			else
					puts "incorrecto"
					sleep 1
			end
			aux = aux.next
			i-=1
			system "clear"
		end	
		mul=k*2
		puts "Tu nota es: "
		puts mul
	end

	def examInvertido
		i=4
		k=0
		aux = @value.final
		(0..4).each do
			puts "#{aux.value} \n\n Tu respuesta: "
			@respuestas[i] = gets.chomp
			system "clear"
			if @correctas[i] == @respuestas[i] then
					puts "correcto"
					sleep 1
					k+=1
			else
					puts "incorrecto"
					sleep 1
			end
			aux = aux.prev
			i-=1
			system "clear"
		end	
		mul=k*2
		puts "Tu nota es: "
		puts mul
	end

	
end

		exa = Examen.new(@lista)

		exa.examInvertido
