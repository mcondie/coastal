require_relative '../test_helper'

class NoteTest < ActiveSupport::TestCase

  def test_fixtures_validity
    Note.all.each do |note|
      assert note.valid?, note.errors.inspect
    end
  end

  def test_validation
    note = Note.new
    assert note.invalid?
    assert_errors_on note, :name, :description, :photo
  end

  def test_creation
    assert_difference 'Note.count' do
      Note.create(
        :name => 'test name',
        :description => 'test description',
        :photo => 'test photo',
      )
    end
  end

end