# 確認画面表示用
module CheckConfirming
  extend ActiveSupport::Concern

  included do
    validates_acceptance_of :confirming
    after_validation :check_confirming

    def check_confirming
      errors.delete(:confirming)
      self.confirming = errors.empty? ? '1' : ''
    end
  end
end