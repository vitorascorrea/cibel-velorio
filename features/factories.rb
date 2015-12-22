FactoryGirl.define do 

	factory :funcionario do
		sequence(:rf) { |n| "#{n}" }
		password "senha"
		sequence(:nome) { |n| "Agenciador#{n}" }
	end

	factory :agencia do
		sequence(:nome) { |n| "Agencia#{n}" }
	end

	factory :velorio do 		
		sequence(:nome) { |n| "Velorio#{n}" }
	end

	factory :cemiterio do 
		sequence(:nome) { |n| "Cemiterio#{n}" }
	end

	factory :atendente do
		funcionario
		agencia
		adm false
	end

	factory :sala do 
		velorio
		especial false
	end

	factory :reserva do 
		atendente
		sala
		cemiterio
		falecido "Falecido Exemplo"
		municipe "Municipe Exemplo"
		sepultamento Time.at(0)
	end
end