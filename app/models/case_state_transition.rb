class CaseStateTransition < ApplicationRecord
  belongs_to :originator, class_name: 'Case', foreign_key: 'case_id'

  has_many :friendships
  has_many :ops, through: :friendships, source: 'op_state_transition'

  before_create :set_ops

  #def ops=(objs)  #attr_accessor
  #  @ops = objs
  #end

  def obj
    o = Case.new(ActiveSupport::JSON.decode dump)
    o.readonly!
    o
  end

  def set_ops
    p "touched"
    p "----------------!!---------"
    p originator.associated_ops.inspect

    #ops = originator.associated_ops

    #originator.associated_ops.each do |x|
    #  ops << x
    #end
  end
end
