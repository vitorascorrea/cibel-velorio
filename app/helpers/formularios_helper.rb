module FormulariosHelper
	
	def geraMatriz(velorio)
		matriz = Array.new(velorio.salas.count+1) { Array.new(25) }
		horario_atual = Time.now.in_time_zone

		#Construindo a matriz
		matriz[0][0] = ""

		for y in 1..25
			matriz[0][y] = horario_atual
			horario_atual = horario_atual + 3600			
		end

		for x in 1..velorio.salas.count
			matriz[x][0] = x
		end
		#Fim da construção
		trocou_dia = false
		
		for x in 1..velorio.salas.count
			ultimo_sepultamento_sala = ultimoSepultamento(velorio.salas[x-1])		
				for y in 1..25
					trocou_dia = true if matriz[0][y] == 0					
					if trocou_dia
						if !ultimo_sepultamento_sala.nil? && matriz[0][y] <= (ultimo_sepultamento_sala)
							matriz[x][y] = 'p' #Periodo preenchido
						else
							matriz[x][y] = matriz[0][y] #Periodo vago
						end
					else
						if !ultimo_sepultamento_sala.nil? && matriz[0][y] <= (ultimo_sepultamento_sala)
							matriz[x][y] = 'p' #Periodo preenchido
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
		sala.reservas.order(sepultamento: :desc).first.try(:sepultamento)
	end
end
