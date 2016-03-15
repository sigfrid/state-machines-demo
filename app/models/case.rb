class Case < ApplicationRecord
  has_many :transitions, class_name: 'CaseStateTransition'

  state_machine :state, initial: :saved do
    audit_trail context: :dump

    event :edit do
      transition [:saved, :edited] => :edited
    end

    event :hide do
      transition [:saved, :edited] => :hidden
    end
  end

  def dump
    ActiveSupport::JSON.encode self
  end

  def ops
    transitions.last.ops
  end

  def associated_ops=(objs)
    @associated_ops = Array(objs)
  end

  def associated_ops
    @associated_ops
  end
end
