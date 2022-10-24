require 'csv'
class Gossip
   attr_accessor :author, :content

    def initialize (author, content)
        @author = author
        @content = content
    end

    #sauvegarde l'instance dans le fichier csv
    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
    end
    end
    
    #methode qui définit une liste de tout les gossip
    def self.all
        all_gossips = [] #initialise un array vide 
        CSV.read("./db/gossip.csv").each do |line|
           all_gossips << Gossip.new(line[0],line[1]) 
        end
        return all_gossips #on retourne un array rempli d'objets 

    end
    
    def self.find(id)
		return Gossip.all[id]
    end
end
