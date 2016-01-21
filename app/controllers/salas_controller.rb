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
		@sala.update_attributes(justificativa: params[:sala][:justificativa], desabilitada: desab)
		redirect_to index_interditar_path
	end
end
