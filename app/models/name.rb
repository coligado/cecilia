class Name < ActiveRecord::Base
  # validates_presence_of :gender, :first_name, :last_name
  
  def validate_name
    if gender.nil? or first_name.empty? or last_name.empty?
      errors.add(:name, "Please complete all fields.")
      errors.add(:name, "Si prega di compilare tutte le voci.")
      return
    end

    if first_name.length < 2
      errors.add(:name, "First name must be at least 2 characters.")
      errors.add(:name, "Il tuo nome deve essere di almeno 2 caratteri.")
      return
    end

    if first_name.length > 14
      errors.add(:name, "First name must be less than 14 characters.")
      errors.add(:name, "Il tuo nome deve essere al massimo di 14 caratteri.")
      return
    end

    if last_name.length < 2
      errors.add(:name, "Last name must be at least 2 characters.")
      errors.add(:name, "Il tuo cognome deve essere di almeno 2 caratteri.")
      return
    end

    if last_name.length > 14
      errors.add(:name, "Last name must be less than 14 characters.")
      errors.add(:name, "Il tuo nome deve essere al massimo di 14 caratteri.")
      return
    end
  end

  validate :validate_name
end