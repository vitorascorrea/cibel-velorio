class SalasController < ApplicationController
	def index_interditar
	end 
	
	def selecao_velorio_interditar
		@velorio = Velorio.find(params[:velorio_id])
		respond_to do |format|
	    	format.js
	    end
	end

	def interditar_sala
		@sala = Sala.find(params[:sala][:id_edit])
		@sala.desabilitada ? desab = false : desab = true
		@sala.update_attributes(desabilitada: desab)
		desab ? a = "Desinterditar sala" : a = "Interditar sala"
    Justificativa.create(sala: @sala.id, acao: a, justificativa: params[:sala][:justificativa], atendente: current_funcionario.id, horario: Time.now.in_time_zone)
		redirect_to index_interditar_path
	end
end
