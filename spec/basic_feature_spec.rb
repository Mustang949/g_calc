require 'rails_helper'
require_relative 'support/calc_page'

# Run these tests as often as possible
RSpec.feature 'Within the Calcualtor basic functions work correctly' do
	let(:page) { ::CalcPage.new }

  scenario 'addition' do
    page.load
    page.one.click
    page.plus.click
    page.one.click
    expect(page.display.text).to eq('1 + 1')
    page.equals.click
    expect(page.display.text).to eq('2')
  end

  scenario 'subtraction' do
    page.load
    page.one.click
    page.minus.click
    page.one.click
    expect(page.display.text).to eq('1 - 1')
    page.equals.click
    expect(page.display.text).to eq('0')
  end

  scenario 'multiplication' do
    page.load
    page.two.click
    page.multiplication.click
    page.three.click
    expect(page.display.text).to eq('2 × 3')
    page.equals.click
    expect(page.display.text).to eq('6')
  end
    
  scenario 'division' do
    page.load
    page.one.click
    page.division.click
    page.one.click
    page.zero.click
    expect(page.display.text).to eq('1 ÷ 10')
    page.equals.click
    expect(page.display.text).to eq('0.1')
  end
end