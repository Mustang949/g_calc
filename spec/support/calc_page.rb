class CalcPage
  include RSpec::Matchers
  include Capybara::DSL

  def load
  	visit '/search?q=calculator'
  	expect(self).to have_loaded
  end

  def has_loaded?
  	self.has_selector? '#cwos'
  end

  def one
  	find('[jsname="N10B9"]')
  end

  def two
  	find('[jsname="lVjWed"]')
  end

  def three
  	find('[jsname="KN1kY"]')
  end

  def four
  	find('[jsname="xAP7E"]')
  end

  def five
  	find('[jsname="Ax5wH"]')
  end

  def six
  	find('[jsname="abcgof"]')
  end

  def seven
  	find('[jsname="rk7bOd"]')
  end

  def eight
  	find('[jsname="T7PMFe"]')
  end

  def nine
  	find('[jsname="XoxYJ"]')
  end

  def zero
  	find('[jsname="bkEvMb"]')
  end

  def equals
  	find('[aria-label="equals"]')
  end

  def clear # TODO: May need some work
  	if clear_entry.visible?
  		clear_entry
  	else
  		all_clear
  	end
  end

  def clear_entry
  	find('[jsname="H7sWPd"]')
  end

  def all_clear
  	find('[jsname="SLn8gc"]')
  end

  def point
  	find('[aria-label="point"]')
  end

  def display
  	find('#cwos')
  end

  def plus
  	find('[aria-label="plus"]')
  end

  def minus
  	find('[aria-label="minus"]')
  end

  def multiplication
  	find('[aria-label="multiply"]')
  end

  def division
  	find('[aria-label="divide"]')
  end

  def buttons
  	[
  		{element: one, value: '1'},
  		{element: two, value: '2'},
  		{element: three, value: '3'},
  		{element: four, value: '4'},
  		{element: five, value: '5'},
  		{element: six, value: '6'},
  		{element: seven, value: '7'},
  		{element: eight, value: '8'},
  		{element: nine, value: '9'},
  		{element: zero, value: '0'},
  		{element: plus, value: '0 +'},
  		{element: minus, value: '0 -'},
  		{element: multiplication, value: '0 ×'},
  		{element: division, value: '0 ÷'},
  		{element: point, value: '0.'},
  		{element: clear, value: '0'},
  		{element: equals, value: '0'},
  	]
  end
end