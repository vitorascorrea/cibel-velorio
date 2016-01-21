module ReservasHelper
	def sala_ocupada? (sala)
		if sala.reservas.any?
			sala.reservas.order(sepultamento: :desc).first.sepultamento > Time.now.in_time_zone
		else
			return false
		end
	end
end
