require_relative '../test_helper'

class PhotoTest < ActiveSupport::TestCase

  def test_fixtures_validity
    Photo.all.each do |photo|
      assert photo.valid?, photo.errors.inspect
    end
  end

  def test_validation
    photo = Photo.new
    assert photo.invalid?
    assert_errors_on photo, :title, :description
  end

  def test_creation
    assert_difference 'Photo.count' do
      Photo.create(
        :title => 'test title',
        :description => 'test description',
      )
    end
  end

end