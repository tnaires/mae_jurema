class HomeController < ApplicationController
  def index
  end

  def iniciar
  	session[:caracteristicas] = []
  	Pergunta.update_all(resposta: '')
  	proxima_pergunta
  end

  def nao
  	pergunta = Pergunta.find(params[:id])
  	pergunta.resposta = 'n'
  	pergunta.save
  	proxima_pergunta
  end

  def sim
  	pergunta = Pergunta.find(params[:id])
  	pergunta.resposta = 's'
  	pergunta.save
  	session[:caracteristicas] << pergunta.caracteristica
  	pessoa = Pessoa.com(session[:caracteristicas])
  	if pessoa
  		@pessoa = pessoa
  		render :resultado
  	else
  		proxima_pergunta
  	end
  end

  private 

  def proxima_pergunta
  	@pergunta = Pergunta.where(resposta: '').first
  	if @pergunta.nil?
  		render :falha
  	else 
		render :pergunta
	end
  end
end
