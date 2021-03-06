class Examen

	include Enumerable
	
	attr_accessor :value, :correctas, :respuestas

	def initialize value,respuestas
		@value = value
		@correctas = ["a","b","a","a","b"]
		@respuestas = respuestas
	end

	def to_s
		@value.reverse_each {|x| puts "#{x}"}
=begin
		aux = @value.inicio
		i=1
		while i<6 do	
				puts "#{aux.value}"
				aux = aux.next
				i+=1
		end
=end
	end

	def mostrar(i)
		aux = @value.inicio
		j=1
		while j<i do	
				aux = aux.next
				j+=1
		end
		"#{aux.value}"
	end

	def exam
		k=0
		(0..4).each do |i|
			if @correctas[i] == @respuestas[i] then
				k+=1
			end
		end
		if k==5 then
			return "true"
		else
			return "false"
		end
	end

	def examInvertido
		i=4
		k=0
		(0..4).each do |e|
			if @correctas[i] == @respuestas[e] then
				k+=1
			end
			i-=1
		end
		if k==5 then
			return "true"
		else
			return "false"
		end
	end
end
