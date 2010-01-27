require 'rubygems'
require 'merb-core'
require 'test/unit'

Merb.start_environment(:testing => true, :adapter => 'runner', :environment => ENV['MERB_ENV'] || 'test')

require 'features/support/blueprints'

module CustomAssertions
  def assert_invalid(object, field, msg, &blk)
    blk.call
    begin
      object.save
    rescue Sequel::ValidationFailed
    end
    messages = object.errors.on(field)
    assert messages, "No errors for field %p" % [field]
    assert messages.include?(msg), "Message %p not included in %p" % [msg, messages]
  end
end

class Test::Unit::TestCase
  include CustomAssertions
end

LectureType.delete
Lecture.delete
Degree.delete
University.delete
