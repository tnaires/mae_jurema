class Pessoa < ActiveRecord::Base
  attr_accessible :caracteristicas, :foto, :nome
  mount_uploader :foto, FotoUploader

  def self.com(caracteristicas)
  	Pessoa.all.each do |pessoa|
  		return pessoa if pessoa.caracteristicas.split(',').map(&:split).sort.join(',') == caracteristicas.sort.join(',')
  	end
  	nil
  end	
end
