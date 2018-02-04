class Sequence < ApplicationRecord
  establish_connection("#{Rails.env}2".to_sym)

  def self.current_value(sequence_name)
    sequence = self.where(sequence_name: sequence_name).first!
    sequence.sequence_value
  end

  def self.next_value(sequence_name)
    sequence = self.where(sequence_name: sequence_name).first!
    sequence.sequence_value += 1
    sequence.save!
    sequence.sequence_value
  end
end
