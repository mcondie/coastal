require_relative '../test_helper'

class CategoryTest < ActiveSupport::TestCase

  def test_fixtures_validity
    Category.all.each do |category|
      assert category.valid?, category.errors.inspect
    end
  end

  def test_validation
    category = Category.new
    assert category.invalid?
    assert_errors_on category, :name, :description, :parent
  end

  def test_creation
    assert_difference 'Category.count' do
      Category.create(
        :name => 'test name',
        :description => 'test description',
        :parent => 'test parent',
      )
    end
  end

end