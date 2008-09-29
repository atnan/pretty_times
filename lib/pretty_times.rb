require 'action_view/helpers/date_helper'

module PrettyTimes
  def self.included(base)
    base.send(:include, ActionView::Helpers::DateHelper)
    base.send(:extend, ClassMethods)
  end

  module ClassMethods
    def self.extended(base); end

    def pretty_times(*date_attributes)
      date_attributes.each do |date_attribute|
        define_method("#{date_attribute}_in_words") do
          time_ago_in_words(send(date_attribute)) + " ago" rescue nil
        end
      end
    end
  end
end
