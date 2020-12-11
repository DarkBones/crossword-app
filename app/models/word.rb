class Word < ApplicationRecord
	include Identifiable

  # -- Constants ------------------------------------------------------------

  # -- Relationships --------------------------------------------------------

  # -- Callbacks ------------------------------------------------------------
  before_validation :set_length, 		on: :create
  before_validation :upcase_answer, on: :create

  # -- Validations ----------------------------------------------------------
  validates :answer, 	presence: true
  validates :clue, 		presence: true

  # -- Scopes ---------------------------------------------------------------

  # -- Instance Methods -----------------------------------------------------

  # -- Class Methods --------------------------------------------------------

  # -- Private Methods ------------------------------------------------------
  private def set_length
  	self.length = answer&.length || 0
  end

  private def upcase_answer
  	self.answer = answer&.upcase
  end
end
