module FormulariosHelper
	
	def geraMatriz(velorio)
		matriz = Array.new(velorio.salas.count+1) { Array.new(25) }
		horario_atual = Time.now.in_time_zone

		#Construindo a matriz
		matriz[0][0] = ""

		for y in 1..25
			# horario_atual = 0 if horario_atual == 24
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
						if !ultimo_sepultamento_sala.nil? && matriz[0][y] <= (ultimo_sepultamento_sala + 3600) && matriz[0][y] >= pegarInicio(ultimo_sepultamento_sala)
							matriz[x][y] = 'p' #Periodo preenchido
						else
							matriz[x][y] = matriz[0][y] #Periodo vago
						end
					else
						if !ultimo_sepultamento_sala.nil? && matriz[0][y] <= (ultimo_sepultamento_sala + 3600) && matriz[0][y] >= pegarInicio(ultimo_sepultamento_sala)
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

	def transformaTimeStamp(inteiro, n)
		Time.new(Time.now.in_time_zone.year, Time.now.in_time_zone.month, Time.now.in_time_zone.day + n, inteiro).in_time_zone # - Time.now.in_time_zone.utc_offset
	end
	
	def pegarInicio(sepultamento)
		aux = false
		inicio = nil
		@reserva = Reserva.all.where(sepultamento: sepultamento).first
    @reserva.sala.reservas.order(sepultamento: :desc).each do |r|
      if aux == true
        inicio = r.sepultamento + 3600
        break
      end
      if r == @reserva
        aux = true
      end
    end
    inicio ? inicio = inicio : inicio = Time.now.in_time_zone - 3600
	end

end
