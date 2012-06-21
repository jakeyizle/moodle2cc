module Moodle2CC::Moodle
  class Course
    include HappyMapper

    tag 'COURSE'
    element :id, Integer, :tag => 'HEADER/ID'
    element :fullname, String, :tag => 'HEADER/FULLNAME'
    element :shortname, String, :tag => 'HEADER/SHORTNAME'
    has_many :sections, Section
    has_many :mods, Mod

    after_parse do |course|
      course.sections.each { |section| section.course = course }
    end
  end
end