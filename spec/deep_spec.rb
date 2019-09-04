require 'rails_helper'
require_relative 'support/calc_page'

# These tests may take longer than the basic features
RSpec.feature 'Within the Calcualtor basic functions work correctly' do
	let(:page) { ::CalcPage.new }

  scenario 'addition identity' do
    page.load
    page.one.click
    page.plus.click
    page.zero.click
    expect(page.display.text).to eq('1 + 0')
    page.equals.click
    expect(page.display.text).to eq('1')
  end

  scenario 'subtraction identity' do
    page.load
    page.one.click
    page.minus.click
    page.zero.click
    expect(page.display.text).to eq('1 - 0')
    page.equals.click
    expect(page.display.text).to eq('1')
  end

  scenario 'multiplication identity' do
    page.load
    page.two.click
    page.multiplication.click
    page.one.click
    expect(page.display.text).to eq('2 × 1')
    page.equals.click
    expect(page.display.text).to eq('2')
  end
    
  scenario 'division identity' do
    page.load
    page.three.click
    page.division.click
    page.one.click
    expect(page.display.text).to eq('3 ÷ 1')
    page.equals.click
    expect(page.display.text).to eq('3')
  end

  scenario '77.1 * 850 + 1 should equal 65536, old Excel bug' do
    page.load
    page.seven.click
    page.seven.click
    page.point.click
    page.one.click
    page.multiplication.click
    page.eight.click
    page.five.click
    page.zero.click
    page.plus.click
    page.one.click
    expect(page.display.text).to eq('77.1 × 850 + 1')
    page.equals.click
    expect(page.display.text).to eq('65536')
  end

  scenario 'division by zero gives error' do # This should be undefined not infinity
    page.load
    page.one.click
    page.division.click
    page.zero.click
    expect(page.display.text).to eq('1 ÷ 0')
    page.equals.click
    expect(page.display.text).to eq('Infinity')
  end

  scenario 'sum long list of numbers' do
    page.load
    99.times do
      page.seven.click
      page.seven.click
      page.point.click
      page.one.click
      page.plus.click
    end
    page.seven.click
    page.seven.click
    page.point.click
    page.one.click
    page.equals.click
    expect(page.display.text).to eq('7710')
  end

  scenario 'multiply large numbers' do
    page.load
    page.six.click
    page.five.click
    page.five.click
    page.three.click
    page.six.click
    page.multiplication.click
    page.six.click
    page.five.click
    page.five.click
    page.three.click
    page.six.click
    page.multiplication.click
    page.six.click
    page.five.click
    page.five.click
    page.three.click
    page.six.click
    page.equals.click
    expect(page.display.text).to eq('2.8147498e+14')
  end
end