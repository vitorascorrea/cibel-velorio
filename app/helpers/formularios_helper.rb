module FormulariosHelper

	def geraMatriz(velorio, parametro)
		divisor = 60/parametro

		matriz = Array.new(velorio.salas.count+1) { Array.new(48*divisor+1) }

		#Construindo a matriz
		matriz[0][0] = ""

		horario_atual = round_to_next_x_minutes(Time.now.in_time_zone, parametro)
		for y in 1..(48*divisor+1)
			matriz[0][y] = horario_atual
			horario_atual = horario_atual + (parametro * 60)
		end

		for x in 1..velorio.salas.count
			matriz[x][0] = x
		end
		#Fim da construção
		trocou_dia = false

		for x in 1..velorio.salas.count
			ultimo_sepultamento_sala = ultimoSepultamento(velorio.salas[x-1])
				for y in 1..(48*divisor+1)
					trocou_dia = true if matriz[0][y] == 0
					if trocou_dia
						if !ultimo_sepultamento_sala.nil? && matriz[0][y] <= ultimo_sepultamento_sala
							matriz[x][y] = 'p' #Periodo preenchido
						elsif velorio.salas[x-1].desabilitada
							matriz[x][y] = 'o' #sala ocupada
						else
							matriz[x][y] = matriz[0][y] #Periodo vago
						end
					else
						if !ultimo_sepultamento_sala.nil? && matriz[0][y] <= ultimo_sepultamento_sala
							matriz[x][y] = 'p' #Periodo preenchido
						elsif velorio.salas[x-1].desabilitada
							matriz[x][y] = 'o' #sala ocupada
						else
							matriz[x][y] = matriz[0][y] #Periodo vago
						end
					end
				end
				trocou_dia = false
		end
		return matriz
	end

	def ultimoSepultamento(sala)
		sala.reservas.where(excluida: nil).order(sepultamento: :desc).first.try(:sepultamento)
	end

	def round_to_next_x_minutes(horario, x)
		intervalo = 60/x
		i = 1
		minutos = horario.strftime("%M").to_i
		intervalo.times do
			if minutos < x * i
				return horario.beginning_of_hour + x * 60 * i
			end
			i = i + 1
		end
	end

end
