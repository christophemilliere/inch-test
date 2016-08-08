module ImportConcern
  extend ActiveSupport::Concern

  module ClassMethods
    def import(objet, file)
        CSV.foreach(file.path, headers: true) do |row|
          hash = row.to_hash
          if objet == Building
            save_building(hash)
          else
            save_person(hash)
          end
        end
    end

    private
    # save person csv
    def save_person(hash)
      person = Person.where('firstname = ? AND lastname = ?', hash["firstname"], hash["lastname"])
      if person.present?
        if hash["email"] != person.first.email
          person.update_all(person_hash)
        end
      else
        Person.create!(hash) unless person.nil?
      end
    end

    #save buildings
    def save_building(hash)
      building = Building.where(reference: hash["reference"])

      if building.present?
        if building.first.address != hash["address"] || building.first.manager_name != hash["manager_name"]
          building.first.update_attributes(hash)
        end
      else
        Building.create!(hash)
      end
    end
  end
end
