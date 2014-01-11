require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    # puts css_select 'h3' # would return <h3>MyString</h3>\n<h3>MyString</h3>\n<h3>Pickaxe Book</h3>
  end

  test "use CSS for Store" do
    get :index
    # assert_select matches number of HTML elements found, given CSS selectors
    # first two return number, no assert number matchers used
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3 # 3 entries in test data
    # Here need to appreciate that Controller tests just test Controllers
    # no Model validation undertaken, so two fixtures with 'MyString' book
    # title are tested
    #
    # ** assert-select true if the text value of AT LEAST ONE ELEMENT matches string **
    assert_select 'h3', 'Pickaxe Book'
  end

  test "should use currency formatting" do
    get :index
    prices = css_select '.price' # selects array of HTML matched
    prices.each do |price|
      assert((price =~ /\$[,\d]+\.\d\d/) == 0), "Price: #{price} failed test")
    end
    # assert_select '.price', /\$[,\d]+\.\d\d/ # Bad test as passes if ANY ONE element is so formatted
  end

end # of class
