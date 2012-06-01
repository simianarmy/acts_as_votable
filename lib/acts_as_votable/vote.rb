require 'acts_as_votable/helpers/words'

module ActsAsVotable
  class Vote < ::ActiveRecord::Base

    include Helpers::Words

    attr_accessible :votable_id, :votable_type,
      :voter_id, :voter_type,
      :votable, :voter,
      :vote_flag

    belongs_to :votable, :polymorphic => true
    belongs_to :voter, :polymorphic => true

    named_scope :up, :conditions => {:vote_flag => true}
    named_scope :down, :conditions => {:vote_flag => false}
    named_scope :for_type, lambda{ |klass| { :conditions => {:votable_type => klass.to_s} } }
    named_scope :by_type,  lambda{ |klass| { :conditions => {:voter_type => klass.to_s} } }

    validates_presence_of :votable_id
    validates_presence_of :voter_id

  end

end

